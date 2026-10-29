import 'package:flutter/material.dart';
import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/localization/l10n_extensions.dart';
import 'package:pocket_garden/core/theme/app_spacing.dart';
import 'package:pocket_garden/shared/presentation/widgets/plant_photo.dart';

class PlantFormPhotoField extends StatelessWidget {
  const PlantFormPhotoField({
    required this.relativePhotoPath,
    required this.selectedPhotoPath,
    required this.nickname,
    required this.onSelect,
    required this.onRemove,
    super.key,
  });

  final String? relativePhotoPath;
  final String? selectedPhotoPath;
  final String nickname;
  final VoidCallback onSelect;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final selectedPhoto = selectedPhotoPath;
    final hasPhoto = selectedPhoto != null || relativePhotoPath != null;
    final semanticLabel = l10n.plantPhotoSemantics(
      nickname.isEmpty ? l10n.newPlantTitle : nickname,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.photoSectionTitle,
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: AppSpacing.sm),
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: selectedPhoto != null
                ? SelectedPhotoPreview(
                    absolutePath: selectedPhoto,
                    semanticLabel: l10n.photoPreviewSemantics,
                  )
                : PlantPhoto(
                    relativePath: relativePhotoPath,
                    semanticLabel: semanticLabel,
                    cacheWidth: AppConstants.selectedImageCacheSize,
                  ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            OutlinedButton.icon(
              onPressed: onSelect,
              icon: const Icon(Icons.add_a_photo_outlined),
              label: Text(hasPhoto ? l10n.changePhoto : l10n.addPhoto),
            ),
            if (hasPhoto)
              TextButton.icon(
                onPressed: onRemove,
                icon: const Icon(Icons.delete_outline),
                label: Text(l10n.removePhoto),
              ),
          ],
        ),
      ],
    );
  }
}
