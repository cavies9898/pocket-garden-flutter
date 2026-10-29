import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/database/database_providers.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/core/localization/generated/app_localizations.dart';
import 'package:pocket_garden/core/localization/l10n_extensions.dart';
import 'package:pocket_garden/core/router/app_router.dart';
import 'package:pocket_garden/core/theme/app_spacing.dart';
import 'package:pocket_garden/core/theme/app_theme.dart';
import 'package:pocket_garden/features/settings/domain/entities/app_settings.dart';
import 'package:pocket_garden/features/settings/presentation/controllers/settings_providers.dart';
import 'package:pocket_garden/features/species_catalog/presentation/providers/species_providers.dart';
import 'package:pocket_garden/shared/presentation/widgets/app_states.dart';

class PocketGardenApp extends ConsumerWidget {
  const PocketGardenApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(
      settingsControllerProvider.select((state) => state.settings),
    );
    final bootstrap = ref.watch(appBootstrapProvider);
    final isReady = switch (bootstrap) {
      AsyncData(:final value) when value.isSuccess => true,
      _ => false,
    };

    if (isReady) {
      return MaterialApp.router(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: _themeMode(settings.themeMode),
        locale: _locale(settings.language),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        onGenerateTitle: (context) => context.l10n.appTitle,
        routerConfig: ref.watch(appRouterProvider),
      );
    }

    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: _themeMode(settings.themeMode),
      locale: _locale(settings.language),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateTitle: (context) => context.l10n.appTitle,
      home: switch (bootstrap) {
        AsyncData(:final value) => switch (value) {
          FailureResult() => const _StartupFailure(),
          Success() => const _StartupLoading(),
        },
        AsyncError() => const _StartupFailure(),
        _ => const _StartupLoading(),
      },
    );
  }

  ThemeMode _themeMode(AppThemeMode mode) => switch (mode) {
    AppThemeMode.system => ThemeMode.system,
    AppThemeMode.light => ThemeMode.light,
    AppThemeMode.dark => ThemeMode.dark,
  };

  Locale? _locale(AppLanguage language) => switch (language) {
    AppLanguage.system => null,
    AppLanguage.english => const Locale('en'),
    AppLanguage.spanish => const Locale('es'),
  };
}

class _StartupLoading extends StatelessWidget {
  const _StartupLoading();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Semantics(
          label: context.l10n.startupLoading,
          liveRegion: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.local_florist, size: 56),
              const SizedBox(height: AppSpacing.xl),
              const SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(context.l10n.startupLoading),
            ],
          ),
        ),
      ),
    );
  }
}

class _StartupFailure extends ConsumerWidget {
  const _StartupFailure();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return Scaffold(
      body: AppErrorState(
        title: l10n.startupErrorTitle,
        message: l10n.startupErrorBody,
        retryLabel: l10n.startupRetry,
        onRetry: () {
          ref
            ..invalidate(speciesCatalogSeederProvider)
            ..invalidate(speciesLocalDataSourceProvider)
            ..invalidate(appDatabaseProvider)
            ..invalidate(appBootstrapProvider);
        },
      ),
    );
  }
}
