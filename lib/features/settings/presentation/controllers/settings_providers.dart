import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocket_garden/core/database/database_providers.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/settings/data/repositories/shared_preferences_settings_repository.dart';
import 'package:pocket_garden/features/settings/domain/entities/app_settings.dart';
import 'package:pocket_garden/features/settings/domain/repositories/settings_repository.dart';
import 'package:pocket_garden/features/settings/domain/usecases/settings_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_providers.freezed.dart';
part 'settings_providers.g.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    required AppSettings settings,
    required bool isSaving,
    Failure? failure,
  }) = _SettingsState;
}

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) =>
    SharedPreferencesSettingsRepository(ref.watch(sharedPreferencesProvider));

@Riverpod(keepAlive: true)
GetSettings getSettingsUseCase(Ref ref) =>
    GetSettings(ref.watch(settingsRepositoryProvider));

@Riverpod(keepAlive: true)
SetThemeMode setThemeModeUseCase(Ref ref) =>
    SetThemeMode(ref.watch(settingsRepositoryProvider));

@Riverpod(keepAlive: true)
SetLanguage setLanguageUseCase(Ref ref) =>
    SetLanguage(ref.watch(settingsRepositoryProvider));

@Riverpod(keepAlive: true)
class SettingsController extends _$SettingsController {
  @override
  SettingsState build() => SettingsState(
    settings: ref.watch(getSettingsUseCaseProvider)(),
    isSaving: false,
  );

  Future<void> setThemeMode(AppThemeMode themeMode) {
    return _apply(() => ref.read(setThemeModeUseCaseProvider)(themeMode));
  }

  Future<void> setLanguage(AppLanguage language) {
    return _apply(() => ref.read(setLanguageUseCaseProvider)(language));
  }

  void clearFailure() {
    state = state.copyWith(failure: null);
  }

  Future<void> _apply(Future<Result<AppSettings>> Function() action) async {
    if (state.isSaving) {
      return;
    }
    final previous = state.settings;
    state = SettingsState(settings: previous, isSaving: true);

    final result = await action();
    state = switch (result) {
      Success(:final value) => SettingsState(settings: value, isSaving: false),
      FailureResult(:final failure) => SettingsState(
        settings: previous,
        isSaving: false,
        failure: failure,
      ),
    };
  }
}
