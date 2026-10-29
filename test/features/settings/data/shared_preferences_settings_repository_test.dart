import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_garden/features/settings/data/repositories/shared_preferences_settings_repository.dart';
import 'package:pocket_garden/features/settings/domain/entities/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<SharedPreferencesSettingsRepository> createRepository() async {
    final preferences = await SharedPreferences.getInstance();
    return SharedPreferencesSettingsRepository(preferences);
  }

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('SharedPreferencesSettingsRepository', () {
    test('returns system defaults when nothing is stored', () async {
      final repository = await createRepository();

      final settings = repository.read();

      expect(settings.themeMode, AppThemeMode.system);
      expect(settings.language, AppLanguage.system);
    });

    test('persists and restores both preferences', () async {
      final repository = await createRepository();
      const settings = AppSettings(
        themeMode: AppThemeMode.dark,
        language: AppLanguage.spanish,
      );

      final result = await repository.write(settings);
      final restored = (await createRepository()).read();

      expect(result.isSuccess, isTrue);
      expect(restored, settings);
    });

    test('falls back per field when a stored value is unknown', () async {
      SharedPreferences.setMockInitialValues({
        'settings.theme_mode': 'sepia',
        'settings.language': 'spanish',
      });
      final repository = await createRepository();

      final settings = repository.read();

      expect(settings.themeMode, AppThemeMode.system);
      expect(settings.language, AppLanguage.spanish);
    });

    test('ignores values stored with the wrong type', () async {
      SharedPreferences.setMockInitialValues({
        'settings.theme_mode': 42,
        'settings.language': true,
      });
      final repository = await createRepository();

      final settings = repository.read();

      expect(settings.themeMode, AppThemeMode.system);
      expect(settings.language, AppLanguage.system);
    });
  });
}
