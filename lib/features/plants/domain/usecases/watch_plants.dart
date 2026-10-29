import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/domain/repositories/plant_repository.dart';

final class WatchPlants {
  const WatchPlants(this._repository);

  final PlantRepository _repository;

  Stream<Result<List<Plant>>> call() => _repository.watchAll();
}

final class WatchPlant {
  const WatchPlant(this._repository);

  final PlantRepository _repository;

  Stream<Result<Plant?>> call(String id) => _repository.watchById(id);
}
