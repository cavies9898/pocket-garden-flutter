import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/settings/domain/entities/app_settings.dart';
import 'package:pocket_garden/features/settings/domain/repositories/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SharedPreferencesSettingsRepository implements SettingsRepository {
  SharedPreferencesSettingsRepository(this._preferences);

  static const _themeKey = 'settings.theme_mode';
  static const _languageKey = 'settings.language';

  final SharedPreferences _preferences;

  @override
  AppSettings read() => AppSettings(
    themeMode: _readEnum(_themeKey, AppThemeMode.values, AppThemeMode.system),
    language: _readEnum(_languageKey, AppLanguage.values, AppLanguage.system),
  );

  @override
  Future<Result<void>> write(AppSettings settings) async {
    try {
      final themeSaved = await _preferences.setString(
        _themeKey,
        settings.themeMode.name,
      );
      final languageSaved = await _preferences.setString(
        _languageKey,
        settings.language.name,
      );
      if (!themeSaved || !languageSaved) {
        return FailureResult(
          StorageFailure(
            cause: StateError('SharedPreferences rejected a write'),
            stackTrace: StackTrace.current,
          ),
        );
      }
      return const Success(null);
    } on Object catch (error, stackTrace) {
      return FailureResult(
        StorageFailure(cause: error, stackTrace: stackTrace),
      );
    }
  }

  T _readEnum<T extends Enum>(String key, List<T> values, T fallback) {
    try {
      final stored = _preferences.getString(key);
      return values.firstWhere(
        (value) => value.name == stored,
        orElse: () => fallback,
      );
    } on Object {
      // A value persisted with another type by an older build must never keep
      // the app from opening.
      return fallback;
    }
  }
}
