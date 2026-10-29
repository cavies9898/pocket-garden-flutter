// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingsRepository)
final settingsRepositoryProvider = SettingsRepositoryProvider._();

final class SettingsRepositoryProvider
    extends
        $FunctionalProvider<
          SettingsRepository,
          SettingsRepository,
          SettingsRepository
        >
    with $Provider<SettingsRepository> {
  SettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SettingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettingsRepository create(Ref ref) {
    return settingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRepository>(value),
    );
  }
}

String _$settingsRepositoryHash() =>
    r'dd1cdfeb2ac9f93ddc30d3a4bbafdce68301125d';

@ProviderFor(getSettingsUseCase)
final getSettingsUseCaseProvider = GetSettingsUseCaseProvider._();

final class GetSettingsUseCaseProvider
    extends $FunctionalProvider<GetSettings, GetSettings, GetSettings>
    with $Provider<GetSettings> {
  GetSettingsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getSettingsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getSettingsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetSettings> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetSettings create(Ref ref) {
    return getSettingsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetSettings>(value),
    );
  }
}

String _$getSettingsUseCaseHash() =>
    r'2d831a4e629ebb62b58c9e4bf7dfbe04af9fb621';

@ProviderFor(setThemeModeUseCase)
final setThemeModeUseCaseProvider = SetThemeModeUseCaseProvider._();

final class SetThemeModeUseCaseProvider
    extends $FunctionalProvider<SetThemeMode, SetThemeMode, SetThemeMode>
    with $Provider<SetThemeMode> {
  SetThemeModeUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'setThemeModeUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$setThemeModeUseCaseHash();

  @$internal
  @override
  $ProviderElement<SetThemeMode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SetThemeMode create(Ref ref) {
    return setThemeModeUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SetThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SetThemeMode>(value),
    );
  }
}

String _$setThemeModeUseCaseHash() =>
    r'43dc95be28abef6fd3ae5c1e782e0c5dcec0db3d';

@ProviderFor(setLanguageUseCase)
final setLanguageUseCaseProvider = SetLanguageUseCaseProvider._();

final class SetLanguageUseCaseProvider
    extends $FunctionalProvider<SetLanguage, SetLanguage, SetLanguage>
    with $Provider<SetLanguage> {
  SetLanguageUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'setLanguageUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$setLanguageUseCaseHash();

  @$internal
  @override
  $ProviderElement<SetLanguage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SetLanguage create(Ref ref) {
    return setLanguageUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SetLanguage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SetLanguage>(value),
    );
  }
}

String _$setLanguageUseCaseHash() =>
    r'b483e6322756894991e9f51206b0fa9666ee19af';

@ProviderFor(SettingsController)
final settingsControllerProvider = SettingsControllerProvider._();

final class SettingsControllerProvider
    extends $NotifierProvider<SettingsController, SettingsState> {
  SettingsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsControllerHash();

  @$internal
  @override
  SettingsController create() => SettingsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsState>(value),
    );
  }
}

String _$settingsControllerHash() =>
    r'9870de71f53e8c1b34cc2dd82c05cf15e8d3dc56';

abstract class _$SettingsController extends $Notifier<SettingsState> {
  SettingsState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SettingsState, SettingsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SettingsState, SettingsState>,
              SettingsState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
