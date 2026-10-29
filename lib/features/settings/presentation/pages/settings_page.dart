import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_garden/core/localization/l10n_extensions.dart';
import 'package:pocket_garden/core/theme/app_spacing.dart';
import 'package:pocket_garden/features/settings/domain/entities/app_settings.dart';
import 'package:pocket_garden/features/settings/presentation/controllers/settings_providers.dart';
import 'package:pocket_garden/shared/presentation/widgets/app_states.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final state = ref.watch(settingsControllerProvider);
    final controller = ref.read(settingsControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: AppContentWidth(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.sm,
            AppSpacing.lg,
            AppSpacing.xxxl,
          ),
          children: [
            _LocalOnlyCard(
              title: l10n.localOnlyTitle,
              message: l10n.localOnlyBody,
            ),
            if (state.failure != null) ...[
              const SizedBox(height: AppSpacing.lg),
              AppInlineError(message: l10n.settingsUpdateError),
            ],
            const SizedBox(height: AppSpacing.xl),
            _SettingsSection(
              title: l10n.appearanceTitle,
              child: AbsorbPointer(
                absorbing: state.isSaving,
                child: RadioGroup<AppThemeMode>(
                  groupValue: state.settings.themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      unawaited(controller.setThemeMode(value));
                    }
                  },
                  child: Column(
                    children: [
                      for (final mode in AppThemeMode.values)
                        RadioListTile<AppThemeMode>(
                          value: mode,
                          title: Text(_themeModeLabel(context, mode)),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            _SettingsSection(
              title: l10n.languageTitle,
              child: DropdownButtonFormField<AppLanguage>(
                initialValue: state.settings.language,
                isExpanded: true,
                decoration: const InputDecoration(),
                items: [
                  for (final language in AppLanguage.values)
                    DropdownMenuItem(
                      value: language,
                      child: Text(_languageLabel(context, language)),
                    ),
                ],
                onChanged: state.isSaving
                    ? null
                    : (value) {
                        if (value != null) {
                          unawaited(controller.setLanguage(value));
                        }
                      },
              ),
            ),
            if (state.isSaving) ...[
              const SizedBox(height: AppSpacing.lg),
              Semantics(
                label: l10n.settingsLoading,
                child: const LinearProgressIndicator(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _themeModeLabel(BuildContext context, AppThemeMode mode) {
    final l10n = context.l10n;
    return switch (mode) {
      AppThemeMode.system => l10n.appearanceSystem,
      AppThemeMode.light => l10n.appearanceLight,
      AppThemeMode.dark => l10n.appearanceDark,
    };
  }

  String _languageLabel(BuildContext context, AppLanguage language) {
    final l10n = context.l10n;
    return switch (language) {
      AppLanguage.system => l10n.languageSystem,
      AppLanguage.english => l10n.languageEnglish,
      AppLanguage.spanish => l10n.languageSpanish,
    };
  }
}

class _LocalOnlyCard extends StatelessWidget {
  const _LocalOnlyCard({required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.lock_outline, color: colorScheme.onPrimaryContainer),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.bodyMedium
                        ?.copyWith(color: colorScheme.onPrimaryContainer),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.title, required this.child});

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
