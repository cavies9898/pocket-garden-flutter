import 'package:flutter/material.dart';
import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/localization/l10n_extensions.dart';
import 'package:pocket_garden/core/theme/app_spacing.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/presentation/utils/plant_labels.dart';
import 'package:pocket_garden/features/plants/presentation/widgets/plant_photo_hero.dart';
import 'package:pocket_garden/shared/presentation/widgets/plant_photo.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({required this.plant, required this.onTap, super.key});

  final Plant plant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final speciesName = plant.species.localizedCommonName(l10n);
    final location = plant.location.label(l10n);
    return Semantics(
      button: true,
      label: l10n.openPlantSemantics(plant.nickname, speciesName, location),
      onTap: onTap,
      child: ExcludeSemantics(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 10,
                  child: PlantPhotoHero(
                    plantId: plant.id,
                    child: PlantPhoto(
                      relativePath: plant.photoPath,
                      semanticLabel: l10n.plantPhotoSemantics(plant.nickname),
                      cacheWidth: AppConstants.cardImageCacheSize,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plant.nickname,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        '$speciesName · ${plant.species.scientificName}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Wrap(
                        spacing: AppSpacing.sm,
                        runSpacing: AppSpacing.sm,
                        children: [
                          _PlantPill(
                            icon: Icons.water_drop_outlined,
                            label: l10n.careEveryDays(
                              plant.species.wateringFrequencyDays,
                            ),
                          ),
                          _PlantPill(
                            icon: Icons.place_outlined,
                            label: location,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlantPill extends StatelessWidget {
  const _PlantPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: colorScheme.onSurfaceVariant),
            const SizedBox(width: AppSpacing.xs),
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium
                  ?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
