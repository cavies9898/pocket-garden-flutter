import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/settings/domain/entities/app_settings.dart';

abstract interface class SettingsRepository {
  AppSettings read();

  Future<Result<void>> write(AppSettings settings);
}
