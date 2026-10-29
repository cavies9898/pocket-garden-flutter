import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/settings/domain/entities/app_settings.dart';
import 'package:pocket_garden/features/settings/domain/repositories/settings_repository.dart';

final class GetSettings {
  const GetSettings(this._repository);

  final SettingsRepository _repository;

  AppSettings call() => _repository.read();
}

final class SetThemeMode {
  const SetThemeMode(this._repository);

  final SettingsRepository _repository;

  Future<Result<AppSettings>> call(AppThemeMode themeMode) async {
    final updated = _repository.read().copyWith(themeMode: themeMode);
    final result = await _repository.write(updated);
    return result.map((_) => updated);
  }
}

final class SetLanguage {
  const SetLanguage(this._repository);

  final SettingsRepository _repository;

  Future<Result<AppSettings>> call(AppLanguage language) async {
    final updated = _repository.read().copyWith(language: language);
    final result = await _repository.write(updated);
    return result.map((_) => updated);
  }
}
