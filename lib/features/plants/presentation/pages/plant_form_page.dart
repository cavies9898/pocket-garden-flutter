import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/core/localization/l10n_extensions.dart';
import 'package:pocket_garden/core/router/app_routes.dart';
import 'package:pocket_garden/core/theme/app_spacing.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/presentation/controllers/plant_form_controller.dart';
import 'package:pocket_garden/features/plants/presentation/controllers/plant_form_state.dart';
import 'package:pocket_garden/features/plants/presentation/services/photo_picker.dart';
import 'package:pocket_garden/features/plants/presentation/utils/plant_labels.dart';
import 'package:pocket_garden/features/plants/presentation/widgets/plant_form_photo_field.dart';
import 'package:pocket_garden/shared/presentation/utils/failure_messages.dart';
import 'package:pocket_garden/shared/presentation/widgets/app_states.dart';

class PlantFormPage extends ConsumerStatefulWidget {
  const PlantFormPage({this.plantId, super.key});

  final String? plantId;

  @override
  ConsumerState<PlantFormPage> createState() => _PlantFormPageState();
}

class _PlantFormPageState extends ConsumerState<PlantFormPage> {
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(plantFormControllerProvider(widget.plantId));
    final l10n = context.l10n;
    return switch (formState) {
      AsyncData(:final value) => _buildForm(context, value),
      AsyncError(:final error) => Scaffold(
        appBar: AppBar(title: Text(l10n.newPlantTitle)),
        body: AppErrorState(
          message: error is Failure
              ? failureMessage(l10n, error)
              : l10n.errorUnexpected,
          retryLabel: l10n.retry,
          onRetry: () =>
              ref.invalidate(plantFormControllerProvider(widget.plantId)),
        ),
      ),
      _ => Scaffold(
        appBar: AppBar(title: Text(l10n.newPlantTitle)),
        body: _PlantFormSkeleton(semanticLabel: l10n.loadingForm),
      ),
    };
  }

  Widget _buildForm(BuildContext context, PlantFormState formState) {
    final l10n = context.l10n;
    final controller = ref.read(
      plantFormControllerProvider(widget.plantId).notifier,
    );
    if (formState.loadFailure case final failure?) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            formState.isEditing
                ? l10n.editPlantTitle(formState.nickname)
                : l10n.newPlantTitle,
          ),
        ),
        body: AppErrorState(
          message: failureMessage(l10n, failure),
          retryLabel: l10n.formLoadRetry,
          onRetry: controller.retryLoad,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          formState.isEditing
              ? l10n.editPlantTitle(formState.nickname)
              : l10n.newPlantTitle,
        ),
      ),
      body: AbsorbPointer(
        absorbing: formState.isSaving,
        child: AnimatedOpacity(
          opacity: formState.isSaving ? 0.65 : 1,
          duration: AppConstants.defaultAnimationDuration,
          child: _PlantFormContent(
            key: ValueKey(formState.original?.id ?? 'new-plant'),
            formState: formState,
            onNicknameChanged: controller.updateNickname,
            onSpeciesChanged: controller.updateSpecies,
            onLocationChanged: controller.updateLocation,
            onNotesChanged: controller.updateNotes,
            onSelectPhoto: _selectPhoto,
            onRemovePhoto: controller.clearPhoto,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.sm,
          AppSpacing.lg,
          AppSpacing.lg,
        ),
        child: Center(
          heightFactor: 1,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppConstants.maxReadableContentWidth,
            ),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: formState.isSaving ? null : _save,
                icon: formState.isSaving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.check),
                label: Text(formState.isSaving ? l10n.saving : l10n.savePlant),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final result = await ref
        .read(plantFormControllerProvider(widget.plantId).notifier)
        .save();
    if (!mounted) {
      return;
    }
    if (result case Success(:final value)) {
      context.go(AppRoutes.plantDetails(value.id));
    }
  }

  Future<void> _selectPhoto() async {
    final source = await _showPhotoSource();
    if (!mounted || source == null) {
      return;
    }

    final picker = ref.read(photoPickerProvider);
    if (source == PhotoSource.camera &&
        defaultTargetPlatform != TargetPlatform.iOS) {
      final granted = await picker.isCameraPermissionGranted();
      if (!mounted) {
        return;
      }
      if (!granted) {
        final shouldRequest = await _showCameraRationale();
        if (shouldRequest != true) {
          return;
        }
        final permission = await picker.requestCameraPermission();
        if (!mounted) {
          return;
        }
        if (permission case FailureResult(:final failure)) {
          _showFailure(failure);
          return;
        }
      }
    }

    final picked = await picker.pick(source);
    if (!mounted) {
      return;
    }
    switch (picked) {
      case Success(:final value):
        if (value != null) {
          ref
              .read(plantFormControllerProvider(widget.plantId).notifier)
              .setPickedPhoto(value);
        }
      case FailureResult(:final failure):
        _showFailure(failure);
    }
  }

  Future<PhotoSource?> _showPhotoSource() {
    final l10n = context.l10n;
    return showModalBottomSheet<PhotoSource>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.sm,
              ),
              child: Text(
                l10n.choosePhotoSourceTitle,
                style: Theme.of(sheetContext).textTheme.titleLarge,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: Text(l10n.takePhoto),
              onTap: () => Navigator.of(sheetContext).pop(PhotoSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(l10n.chooseFromGallery),
              onTap: () => Navigator.of(sheetContext).pop(PhotoSource.gallery),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ),
      ),
    );
  }

  Future<bool?> _showCameraRationale() {
    final l10n = context.l10n;
    return showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.photo_camera_outlined),
        title: Text(l10n.cameraPermissionTitle),
        content: Text(l10n.cameraPermissionBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.cameraPermissionAction),
          ),
        ],
      ),
    );
  }

  void _showFailure(Failure failure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(failureMessage(context.l10n, failure))),
    );
  }
}

class _PlantFormContent extends StatelessWidget {
  const _PlantFormContent({
    required this.formState,
    required this.onNicknameChanged,
    required this.onSpeciesChanged,
    required this.onLocationChanged,
    required this.onNotesChanged,
    required this.onSelectPhoto,
    required this.onRemovePhoto,
    super.key,
  });

  final PlantFormState formState;
  final ValueChanged<String> onNicknameChanged;
  final ValueChanged<String?> onSpeciesChanged;
  final ValueChanged<PlantLocation> onLocationChanged;
  final ValueChanged<String> onNotesChanged;
  final VoidCallback onSelectPhoto;
  final VoidCallback onRemovePhoto;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final photo = PlantFormPhotoField(
      relativePhotoPath: formState.previewPhotoPath,
      selectedPhotoPath: formState.pickedPhotoPath,
      nickname: formState.nickname,
      onSelect: onSelectPhoto,
      onRemove: onRemovePhoto,
    );
    final fields = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (formState.saveFailure case final failure?) ...[
          AppInlineError(message: failureMessage(l10n, failure)),
          const SizedBox(height: AppSpacing.lg),
        ],
        TextFormField(
          key: const ValueKey('plant-nickname-field'),
          initialValue: formState.nickname,
          enabled: !formState.isSaving,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: l10n.nicknameLabel,
            hintText: l10n.nicknameHint,
            errorText: _fieldError(
              context,
              formState,
              ValidationField.nickname,
            ),
          ),
          onChanged: onNicknameChanged,
        ),
        const SizedBox(height: AppSpacing.lg),
        DropdownButtonFormField<String>(
          key: const ValueKey('plant-species-field'),
          initialValue: formState.speciesId,
          isExpanded: true,
          decoration: InputDecoration(
            labelText: l10n.speciesLabel,
            hintText: l10n.speciesHint,
            errorText: _fieldError(
              context,
              formState,
              ValidationField.speciesId,
            ),
          ),
          items: formState.species
              .map(
                (species) => DropdownMenuItem(
                  value: species.id,
                  child: Text(species.localizedCommonName(l10n)),
                ),
              )
              .toList(growable: false),
          onChanged: formState.isSaving ? null : onSpeciesChanged,
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(l10n.locationLabel, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: AppSpacing.sm),
        SegmentedButton<PlantLocation>(
          segments: [
            ButtonSegment(
              value: PlantLocation.indoor,
              icon: const Icon(Icons.home_outlined),
              label: Text(l10n.plantLocationIndoor),
            ),
            ButtonSegment(
              value: PlantLocation.outdoor,
              icon: const Icon(Icons.wb_sunny_outlined),
              label: Text(l10n.plantLocationOutdoor),
            ),
          ],
          selected: {formState.location},
          showSelectedIcon: false,
          onSelectionChanged: formState.isSaving
              ? null
              : (selection) {
                  if (selection.isNotEmpty) {
                    onLocationChanged(selection.first);
                  }
                },
        ),
        const SizedBox(height: AppSpacing.lg),
        TextFormField(
          key: const ValueKey('plant-notes-field'),
          initialValue: formState.notes,
          enabled: !formState.isSaving,
          minLines: 4,
          maxLines: 6,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            labelText: l10n.notesLabel,
            hintText: l10n.notesHint,
            alignLabelWithHint: true,
            errorText: _fieldError(context, formState, ValidationField.notes),
          ),
          onChanged: onNotesChanged,
        ),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide =
            constraints.maxWidth >= AppConstants.wideLayoutBreakpoint;
        return ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.md,
            AppSpacing.lg,
            AppSpacing.xxxl,
          ),
          children: [
            if (isWide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 320, child: photo),
                  const SizedBox(width: AppSpacing.xl),
                  Expanded(child: fields),
                ],
              )
            else ...[
              photo,
              const SizedBox(height: AppSpacing.xl),
              fields,
            ],
          ],
        );
      },
    );
  }

  String? _fieldError(
    BuildContext context,
    PlantFormState state,
    ValidationField field,
  ) {
    final problem = state.fieldErrors[field];
    if (problem == null) {
      return null;
    }
    return validationMessage(
      context.l10n,
      ValidationFailure(field: field, problem: problem),
    );
  }
}

class _PlantFormSkeleton extends StatelessWidget {
  const _PlantFormSkeleton({required this.semanticLabel});

  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.surfaceContainerHighest;
    return Semantics(
      label: semanticLabel,
      liveRegion: true,
      child: ExcludeSemantics(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            for (var index = 0; index < 4; index++) ...[
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ],
        ),
      ),
    );
  }
}
