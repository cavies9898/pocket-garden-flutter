import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocket_garden/core/localization/l10n_extensions.dart';
import 'package:pocket_garden/core/router/app_routes.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.location, required this.child, super.key});

  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isSettings = location.startsWith(AppRoutes.settings);
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: isSettings ? 1 : 0,
        onDestinationSelected: (index) {
          if (index == 0) {
            context.go(AppRoutes.plants);
          } else {
            context.go(AppRoutes.settings);
          }
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.local_florist_outlined),
            selectedIcon: const Icon(Icons.local_florist),
            label: context.l10n.plantsTab,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: context.l10n.settingsTab,
          ),
        ],
      ),
    );
  }
}
