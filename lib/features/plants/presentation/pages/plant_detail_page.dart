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
import 'package:pocket_garden/features/plants/presentation/controllers/delete_plant_controller.dart';
import 'package:pocket_garden/features/plants/presentation/providers/plant_providers.dart';
import 'package:pocket_garden/features/plants/presentation/utils/plant_labels.dart';
import 'package:pocket_garden/features/plants/presentation/widgets/plant_photo_hero.dart';
import 'package:pocket_garden/shared/presentation/utils/failure_messages.dart';
import 'package:pocket_garden/shared/presentation/widgets/app_states.dart';
import 'package:pocket_garden/shared/presentation/widgets/plant_photo.dart';

class PlantDetailPage extends ConsumerWidget {
  const PlantDetailPage({required this.plantId, super.key});

  final String plantId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final plantState = ref.watch(plantProvider(plantId));
    return switch (plantState) {
      AsyncData(:final value) => switch (value) {
        Success(:final value) when value != null => _PlantDetailScaffold(
          plant: value,
        ),
        Success() => Scaffold(
          appBar: AppBar(title: Text(l10n.plantDetailsTitle)),
          body: AppEmptyState(
            icon: Icons.search_off,
            title: l10n.plantNotFoundTitle,
            message: l10n.plantNotFoundBody,
            actionLabel: l10n.backToPlants,
            actionIcon: Icons.arrow_back,
            onAction: () => context.go(AppRoutes.plants),
          ),
        ),
        FailureResult(:final failure) => _DetailErrorScaffold(
          message: failureMessage(l10n, failure),
          onRetry: () => ref.invalidate(plantProvider(plantId)),
        ),
      },
      AsyncError(:final error) => _DetailErrorScaffold(
        message: error is Failure
            ? failureMessage(l10n, error)
            : l10n.errorUnexpected,
        onRetry: () => ref.invalidate(plantProvider(plantId)),
      ),
      _ => Scaffold(
        appBar: AppBar(title: Text(l10n.plantDetailsTitle)),
        body: const Center(child: CircularProgressIndicator()),
      ),
    };
  }
}

class _DetailErrorScaffold extends StatelessWidget {
  const _DetailErrorScaffold({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.plantDetailsTitle)),
      body: AppErrorState(
        message: message,
        retryLabel: context.l10n.retry,
        onRetry: onRetry,
      ),
    );
  }
}

class _PlantDetailScaffold extends ConsumerWidget {
  const _PlantDetailScaffold({required this.plant});

  final Plant plant;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.plantDetailsTitle),
        leading: IconButton(
          onPressed: () => context.go(AppRoutes.plants),
          tooltip: l10n.backToPlants,
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push(AppRoutes.editPlant(plant.id)),
            tooltip: l10n.editPlant,
            icon: const Icon(Icons.edit_outlined),
          ),
          _DeletePlantButton(plant: plant),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      body: _PlantDetailContent(plant: plant),
    );
  }
}

class _DeletePlantButton extends ConsumerWidget {
  const _DeletePlantButton({required this.plant});

  final Plant plant;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isDeleting = ref.watch(
      deletePlantControllerProvider.select((state) => state.isLoading),
    );
    return IconButton(
      onPressed: isDeleting
          ? null
          : () => _confirmAndDelete(context, ref, plant),
      tooltip: l10n.deletePlant,
      icon: isDeleting
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.delete_outline),
    );
  }

  Future<void> _confirmAndDelete(
    BuildContext context,
    WidgetRef ref,
    Plant plant,
  ) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.deletePlantTitle(plant.nickname)),
        content: Text(l10n.deletePlantBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(dialogContext).colorScheme.error,
              foregroundColor: Theme.of(dialogContext).colorScheme.onError,
            ),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) {
      return;
    }

    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    final result = await ref
        .read(deletePlantControllerProvider.notifier)
        .delete(plant.id);
    if (!context.mounted) {
      return;
    }

    switch (result) {
      case Success():
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.plantDeleted(plant.nickname))),
        );
        router.go(AppRoutes.plants);
      case FailureResult(:final failure):
        messenger.showSnackBar(
          SnackBar(content: Text(failureMessage(l10n, failure))),
        );
    }
  }
}

class _PlantDetailContent extends StatelessWidget {
  const _PlantDetailContent({required this.plant});

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide =
            constraints.maxWidth >= AppConstants.wideLayoutBreakpoint;
        final photo = _DetailPhoto(plant: plant);
        final information = _PlantInformation(plant: plant);
        return AppContentWidth(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.sm,
              AppSpacing.lg,
              AppSpacing.xxxl,
            ),
            children: [
              if (isWide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 300, child: photo),
                    const SizedBox(width: AppSpacing.xl),
                    Expanded(child: information),
                  ],
                )
              else ...[
                photo,
                const SizedBox(height: AppSpacing.xl),
                information,
              ],
            ],
          ),
        );
      },
    );
  }
}

class _DetailPhoto extends StatelessWidget {
  const _DetailPhoto({required this.plant});

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: PlantPhotoHero(
          plantId: plant.id,
          child: PlantPhoto(
            relativePath: plant.photoPath,
            semanticLabel: context.l10n.plantPhotoSemantics(plant.nickname),
            cacheWidth: AppConstants.detailImageCacheSize,
          ),
        ),
      ),
    );
  }
}

class _PlantInformation extends StatelessWidget {
  const _PlantInformation({required this.plant});

  final Plant plant;

  String _notesText(Plant plant, String emptyText) {
    final notes = plant.notes;
    return notes == null || notes.isEmpty ? emptyText : notes;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final materialL10n = MaterialLocalizations.of(context);
    final species = plant.species;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(
            plant.nickname,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '${species.localizedCommonName(l10n)} · ${species.scientificName}',
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(color: colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: AppSpacing.md),
        Chip(
          avatar: Icon(
            plant.location == PlantLocation.indoor
                ? Icons.home_outlined
                : Icons.wb_sunny_outlined,
            size: 18,
          ),
          label: Text(plant.location.label(l10n)),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          species.localizedDescription(l10n),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: AppSpacing.xl),
        _SectionCard(
          title: l10n.careGuideTitle,
          child: Column(
            children: [
              _CareRow(
                icon: Icons.water_drop_outlined,
                title: l10n.careWateringTitle,
                value: l10n.careEveryDays(species.wateringFrequencyDays),
              ),
              const Divider(height: AppSpacing.xl),
              _CareRow(
                icon: Icons.compost_outlined,
                title: l10n.careFertilizingTitle,
                value: l10n.careEveryDays(species.fertilizingFrequencyDays),
              ),
              const Divider(height: AppSpacing.xl),
              _CareRow(
                icon: Icons.light_mode_outlined,
                title: l10n.careLightTitle,
                value: species.lightRequirement.label(l10n),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _SectionCard(
          title: l10n.plantNotesTitle,
          child: Text(
            _notesText(plant, l10n.notesEmpty),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _SectionCard(
          title: l10n.plantDetailsTitle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.plantAddedOn(
                  materialL10n.formatMediumDate(plant.createdAt),
                ),
              ),
              if (plant.updatedAt != plant.createdAt) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  l10n.plantUpdatedOn(
                    materialL10n.formatMediumDate(plant.updatedAt),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppSpacing.md),
            child,
          ],
        ),
      ),
    );
  }
}

class _CareRow extends StatelessWidget {
  const _CareRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Semantics(
      label: l10n.careInfoSemantics(title, value),
      child: ExcludeSemantics(
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
            ),
            const SizedBox(width: AppSpacing.sm),
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
