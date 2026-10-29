// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Overridden in `main` after `SharedPreferences.getInstance()` and in tests.
/// Keeping it synchronous means the first frame can use the persisted theme.

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

/// Overridden in `main` after `SharedPreferences.getInstance()` and in tests.
/// Keeping it synchronous means the first frame can use the persisted theme.

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  /// Overridden in `main` after `SharedPreferences.getInstance()` and in tests.
  /// Keeping it synchronous means the first frame can use the persisted theme.
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'927e7fb44d9b12ebcaca8f65a36735cf824c76e6';

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'e5ccc6bda50049df1a8151f1daa4b6aa0721ff70';

@ProviderFor(photoStorage)
final photoStorageProvider = PhotoStorageProvider._();

final class PhotoStorageProvider
    extends $FunctionalProvider<PhotoStorage, PhotoStorage, PhotoStorage>
    with $Provider<PhotoStorage> {
  PhotoStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoStorageHash();

  @$internal
  @override
  $ProviderElement<PhotoStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PhotoStorage create(Ref ref) {
    return photoStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PhotoStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PhotoStorage>(value),
    );
  }
}

String _$photoStorageHash() => r'3b763bd0e398752711a8653bf0410bca98889ffc';

@ProviderFor(resolvedPhotoPath)
final resolvedPhotoPathProvider = ResolvedPhotoPathFamily._();

final class ResolvedPhotoPathProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<String?>>,
          Result<String?>,
          FutureOr<Result<String?>>
        >
    with $FutureModifier<Result<String?>>, $FutureProvider<Result<String?>> {
  ResolvedPhotoPathProvider._({
    required ResolvedPhotoPathFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'resolvedPhotoPathProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$resolvedPhotoPathHash();

  @override
  String toString() {
    return r'resolvedPhotoPathProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result<String?>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<String?>> create(Ref ref) {
    final argument = this.argument as String;
    return resolvedPhotoPath(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ResolvedPhotoPathProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$resolvedPhotoPathHash() => r'709b750a35cbfd0f7ba8375b5f5a3384ba908c17';

final class ResolvedPhotoPathFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result<String?>>, String> {
  ResolvedPhotoPathFamily._()
    : super(
        retry: null,
        name: r'resolvedPhotoPathProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ResolvedPhotoPathProvider call(String relativePath) =>
      ResolvedPhotoPathProvider._(argument: relativePath, from: this);

  @override
  String toString() => r'resolvedPhotoPathProvider';
}

/// Runs once before the router is shown. A failed seed is returned as data so
/// the startup screen can offer a retry without an untyped exception reaching
/// the UI.

@ProviderFor(appBootstrap)
final appBootstrapProvider = AppBootstrapProvider._();

/// Runs once before the router is shown. A failed seed is returned as data so
/// the startup screen can offer a retry without an untyped exception reaching
/// the UI.

final class AppBootstrapProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<void>>,
          Result<void>,
          FutureOr<Result<void>>
        >
    with $FutureModifier<Result<void>>, $FutureProvider<Result<void>> {
  /// Runs once before the router is shown. A failed seed is returned as data so
  /// the startup screen can offer a retry without an untyped exception reaching
  /// the UI.
  AppBootstrapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appBootstrapProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appBootstrapHash();

  @$internal
  @override
  $FutureProviderElement<Result<void>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<void>> create(Ref ref) {
    return appBootstrap(ref);
  }
}

String _$appBootstrapHash() => r'62bf8daaf47f90d949483af4e49439f529f8fc81';
