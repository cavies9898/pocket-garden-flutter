import 'package:pocket_garden/core/database/database_providers.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/plants/data/datasources/plant_local_data_source.dart';
import 'package:pocket_garden/features/plants/data/repositories/plant_repository_impl.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/domain/repositories/plant_repository.dart';
import 'package:pocket_garden/features/plants/domain/usecases/create_plant.dart';
import 'package:pocket_garden/features/plants/domain/usecases/delete_plant.dart';
import 'package:pocket_garden/features/plants/domain/usecases/get_plant.dart';
import 'package:pocket_garden/features/plants/domain/usecases/plant_draft_validator.dart';
import 'package:pocket_garden/features/plants/domain/usecases/update_plant.dart';
import 'package:pocket_garden/features/plants/domain/usecases/watch_plants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'plant_providers.g.dart';

@Riverpod(keepAlive: true)
PlantLocalDataSource plantLocalDataSource(Ref ref) =>
    PlantLocalDataSource(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
PlantRepository plantRepository(Ref ref) => PlantRepositoryImpl(
  ref.watch(plantLocalDataSourceProvider),
  ref.watch(photoStorageProvider),
);

@Riverpod(keepAlive: true)
WatchPlants watchPlantsUseCase(Ref ref) =>
    WatchPlants(ref.watch(plantRepositoryProvider));

@Riverpod(keepAlive: true)
WatchPlant watchPlantUseCase(Ref ref) =>
    WatchPlant(ref.watch(plantRepositoryProvider));

@Riverpod(keepAlive: true)
GetPlant getPlantUseCase(Ref ref) =>
    GetPlant(ref.watch(plantRepositoryProvider));

@Riverpod(keepAlive: true)
CreatePlant createPlantUseCase(Ref ref) => CreatePlant(
  ref.watch(plantRepositoryProvider),
  const PlantDraftValidator(),
);

@Riverpod(keepAlive: true)
UpdatePlant updatePlantUseCase(Ref ref) => UpdatePlant(
  ref.watch(plantRepositoryProvider),
  const PlantDraftValidator(),
);

@Riverpod(keepAlive: true)
DeletePlant deletePlantUseCase(Ref ref) =>
    DeletePlant(ref.watch(plantRepositoryProvider));

@riverpod
Stream<Result<List<Plant>>> plants(Ref ref) =>
    ref.watch(watchPlantsUseCaseProvider)();

@riverpod
Stream<Result<Plant?>> plant(Ref ref, String id) =>
    ref.watch(watchPlantUseCaseProvider)(id);
