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
import 'package:pocket_garden/features/plants/presentation/providers/plant_providers.dart';
import 'package:pocket_garden/features/plants/presentation/widgets/plant_card.dart';
import 'package:pocket_garden/features/plants/presentation/widgets/plants_skeleton.dart';
import 'package:pocket_garden/shared/presentation/utils/failure_messages.dart';
import 'package:pocket_garden/shared/presentation/widgets/app_states.dart';

class PlantsPage extends ConsumerWidget {
  const PlantsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final plants = ref.watch(plantsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.plantsTitle)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRoutes.newPlant),
        tooltip: l10n.addPlant,
        icon: const Icon(Icons.add),
        label: Text(l10n.addPlant),
      ),
      body: AnimatedSwitcher(
        duration: AppConstants.defaultAnimationDuration,
        child: switch (plants) {
          AsyncData(:final value) => switch (value) {
            Success(:final value) => _PlantsList(
              key: const ValueKey('plants-list'),
              plants: value,
              onAddPlant: () => context.push(AppRoutes.newPlant),
              onOpenPlant: (id) => context.push(AppRoutes.plantDetails(id)),
            ),
            FailureResult(:final failure) => AppErrorState(
              key: const ValueKey('plants-error'),
              message: failureMessage(l10n, failure),
              retryLabel: l10n.retry,
              onRetry: () => ref.invalidate(plantsProvider),
            ),
          },
          AsyncError(:final error) => AppErrorState(
            key: const ValueKey('plants-unexpected-error'),
            message: error is Failure
                ? failureMessage(l10n, error)
                : l10n.errorUnexpected,
            retryLabel: l10n.retry,
            onRetry: () => ref.invalidate(plantsProvider),
          ),
          _ => PlantsSkeleton(
            key: const ValueKey('plants-loading'),
            semanticLabel: l10n.loadingPlants,
          ),
        },
      ),
    );
  }
}

class _PlantsList extends StatelessWidget {
  const _PlantsList({
    required this.plants,
    required this.onAddPlant,
    required this.onOpenPlant,
    super.key,
  });

  final List<Plant> plants;
  final VoidCallback onAddPlant;
  final void Function(String id) onOpenPlant;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (plants.isEmpty) {
      return AppEmptyState(
        icon: Icons.local_florist_outlined,
        title: l10n.emptyPlantsTitle,
        message: l10n.emptyPlantsBody,
        actionLabel: l10n.addFirstPlant,
        onAction: onAddPlant,
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide =
            constraints.maxWidth >= AppConstants.wideLayoutBreakpoint;
        final horizontalPadding = isWide ? AppSpacing.xxl : AppSpacing.lg;
        return AppContentWidth(
          child: ListView.separated(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              AppSpacing.sm,
              horizontalPadding,
              AppSpacing.xxxl * 2,
            ),
            itemCount: plants.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppSpacing.lg),
            itemBuilder: (context, index) {
              final plant = plants[index];
              return PlantCard(
                plant: plant,
                onTap: () => onOpenPlant(plant.id),
              );
            },
          ),
        );
      },
    );
  }
}
