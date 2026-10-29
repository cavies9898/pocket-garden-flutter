import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_garden/core/localization/generated/app_localizations.dart';
import 'package:pocket_garden/core/theme/app_theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart' show Override;

/// Builds a realistic app shell for widget and golden tests without starting
/// the production bootstrap, router or database.
Widget buildTestApp({
  required Widget home,
  List<Override> overrides = const [],
  Locale locale = const Locale('en'),
}) {
  return ProviderScope(
    overrides: overrides,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: home,
    ),
  );
}
