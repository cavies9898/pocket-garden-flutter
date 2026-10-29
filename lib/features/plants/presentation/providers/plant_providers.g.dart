// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(plantLocalDataSource)
final plantLocalDataSourceProvider = PlantLocalDataSourceProvider._();

final class PlantLocalDataSourceProvider
    extends
        $FunctionalProvider<
          PlantLocalDataSource,
          PlantLocalDataSource,
          PlantLocalDataSource
        >
    with $Provider<PlantLocalDataSource> {
  PlantLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'plantLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$plantLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<PlantLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PlantLocalDataSource create(Ref ref) {
    return plantLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlantLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlantLocalDataSource>(value),
    );
  }
}

String _$plantLocalDataSourceHash() =>
    r'5445ecb8ed5585fbe1e96e520485388b96f6d9c3';

@ProviderFor(plantRepository)
final plantRepositoryProvider = PlantRepositoryProvider._();

final class PlantRepositoryProvider
    extends
        $FunctionalProvider<PlantRepository, PlantRepository, PlantRepository>
    with $Provider<PlantRepository> {
  PlantRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'plantRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$plantRepositoryHash();

  @$internal
  @override
  $ProviderElement<PlantRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlantRepository create(Ref ref) {
    return plantRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlantRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlantRepository>(value),
    );
  }
}

String _$plantRepositoryHash() => r'902cc6b6ff4a26b47a7de95f37ade608039e7613';

@ProviderFor(watchPlantsUseCase)
final watchPlantsUseCaseProvider = WatchPlantsUseCaseProvider._();

final class WatchPlantsUseCaseProvider
    extends $FunctionalProvider<WatchPlants, WatchPlants, WatchPlants>
    with $Provider<WatchPlants> {
  WatchPlantsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPlantsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPlantsUseCaseHash();

  @$internal
  @override
  $ProviderElement<WatchPlants> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WatchPlants create(Ref ref) {
    return watchPlantsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchPlants value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchPlants>(value),
    );
  }
}

String _$watchPlantsUseCaseHash() =>
    r'31e97e04a7c79dd8d92208d9bba08c628099d05e';

@ProviderFor(watchPlantUseCase)
final watchPlantUseCaseProvider = WatchPlantUseCaseProvider._();

final class WatchPlantUseCaseProvider
    extends $FunctionalProvider<WatchPlant, WatchPlant, WatchPlant>
    with $Provider<WatchPlant> {
  WatchPlantUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPlantUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPlantUseCaseHash();

  @$internal
  @override
  $ProviderElement<WatchPlant> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WatchPlant create(Ref ref) {
    return watchPlantUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchPlant value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchPlant>(value),
    );
  }
}

String _$watchPlantUseCaseHash() => r'be7c13a87040f02a007e1b0e2adc8a3fd3ea82a5';

@ProviderFor(getPlantUseCase)
final getPlantUseCaseProvider = GetPlantUseCaseProvider._();

final class GetPlantUseCaseProvider
    extends $FunctionalProvider<GetPlant, GetPlant, GetPlant>
    with $Provider<GetPlant> {
  GetPlantUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPlantUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPlantUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetPlant> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetPlant create(Ref ref) {
    return getPlantUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPlant value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPlant>(value),
    );
  }
}

String _$getPlantUseCaseHash() => r'52f50bca256d568c93dea46c8c0ba46c761ee34a';

@ProviderFor(createPlantUseCase)
final createPlantUseCaseProvider = CreatePlantUseCaseProvider._();

final class CreatePlantUseCaseProvider
    extends $FunctionalProvider<CreatePlant, CreatePlant, CreatePlant>
    with $Provider<CreatePlant> {
  CreatePlantUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createPlantUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createPlantUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreatePlant> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CreatePlant create(Ref ref) {
    return createPlantUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreatePlant value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreatePlant>(value),
    );
  }
}

String _$createPlantUseCaseHash() =>
    r'2452c4744b9b2afd2e5a1eaee04b5327e75f63a1';

@ProviderFor(updatePlantUseCase)
final updatePlantUseCaseProvider = UpdatePlantUseCaseProvider._();

final class UpdatePlantUseCaseProvider
    extends $FunctionalProvider<UpdatePlant, UpdatePlant, UpdatePlant>
    with $Provider<UpdatePlant> {
  UpdatePlantUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updatePlantUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updatePlantUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdatePlant> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UpdatePlant create(Ref ref) {
    return updatePlantUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdatePlant value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdatePlant>(value),
    );
  }
}

String _$updatePlantUseCaseHash() =>
    r'0c8a2a9cb418a0bace53e75ffbb9cf2bdf8d6829';

@ProviderFor(deletePlantUseCase)
final deletePlantUseCaseProvider = DeletePlantUseCaseProvider._();

final class DeletePlantUseCaseProvider
    extends $FunctionalProvider<DeletePlant, DeletePlant, DeletePlant>
    with $Provider<DeletePlant> {
  DeletePlantUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deletePlantUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deletePlantUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeletePlant> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeletePlant create(Ref ref) {
    return deletePlantUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeletePlant value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeletePlant>(value),
    );
  }
}

String _$deletePlantUseCaseHash() =>
    r'86d125afbccca1b9fc1d33aa05c03b84174816bc';

@ProviderFor(plants)
final plantsProvider = PlantsProvider._();

final class PlantsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<List<Plant>>>,
          Result<List<Plant>>,
          Stream<Result<List<Plant>>>
        >
    with
        $FutureModifier<Result<List<Plant>>>,
        $StreamProvider<Result<List<Plant>>> {
  PlantsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'plantsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$plantsHash();

  @$internal
  @override
  $StreamProviderElement<Result<List<Plant>>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Result<List<Plant>>> create(Ref ref) {
    return plants(ref);
  }
}

String _$plantsHash() => r'f86b56055ca87c004436941cbbc525d5203e200b';

@ProviderFor(plant)
final plantProvider = PlantFamily._();

final class PlantProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<Plant?>>,
          Result<Plant?>,
          Stream<Result<Plant?>>
        >
    with $FutureModifier<Result<Plant?>>, $StreamProvider<Result<Plant?>> {
  PlantProvider._({
    required PlantFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'plantProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$plantHash();

  @override
  String toString() {
    return r'plantProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Result<Plant?>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Result<Plant?>> create(Ref ref) {
    final argument = this.argument as String;
    return plant(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PlantProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$plantHash() => r'7a4c2f7790d2316d06b3eb492dbdceee8fb190c8';

final class PlantFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Result<Plant?>>, String> {
  PlantFamily._()
    : super(
        retry: null,
        name: r'plantProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlantProvider call(String id) => PlantProvider._(argument: id, from: this);

  @override
  String toString() => r'plantProvider';
}
