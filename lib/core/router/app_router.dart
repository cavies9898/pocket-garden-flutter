import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_garden/core/localization/l10n_extensions.dart';
import 'package:pocket_garden/core/router/app_routes.dart';
import 'package:pocket_garden/core/router/app_shell.dart';
import 'package:pocket_garden/features/plants/presentation/pages/plant_detail_page.dart';
import 'package:pocket_garden/features/plants/presentation/pages/plant_form_page.dart';
import 'package:pocket_garden/features/plants/presentation/pages/plants_page.dart';
import 'package:pocket_garden/features/settings/presentation/pages/settings_page.dart';
import 'package:pocket_garden/shared/presentation/widgets/app_states.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    initialLocation: AppRoutes.plants,
    redirect: (context, state) {
      if (state.uri.path == '/') {
        return AppRoutes.plants;
      }
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) =>
            AppShell(location: state.uri.path, child: child),
        routes: [
          GoRoute(
            path: AppRoutes.plants,
            name: 'plants',
            builder: (context, state) => const PlantsPage(),
          ),
          GoRoute(
            path: AppRoutes.settings,
            name: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.newPlant,
        name: 'new-plant',
        builder: (context, state) => const PlantFormPage(),
      ),
      GoRoute(
        path: '/plants/:id',
        name: 'plant-details',
        builder: (context, state) =>
            PlantDetailPage(plantId: state.pathParameters['id'] ?? ''),
      ),
      GoRoute(
        path: '/plants/:id/edit',
        name: 'edit-plant',
        builder: (context, state) =>
            PlantFormPage(plantId: state.pathParameters['id'] ?? ''),
      ),
    ],
    errorBuilder: (context, state) => _RouteErrorPage(location: state.uri),
  );
  ref.onDispose(router.dispose);
  return router;
}

class _RouteErrorPage extends StatelessWidget {
  const _RouteErrorPage({required this.location});

  final Uri location;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: AppEmptyState(
        icon: Icons.wrong_location_outlined,
        title: l10n.routeNotFoundTitle,
        message: '${l10n.routeNotFoundBody}\n${location.path}',
        actionLabel: l10n.backToPlants,
        actionIcon: Icons.arrow_back,
        onAction: () => context.go(AppRoutes.plants),
      ),
    );
  }
}
