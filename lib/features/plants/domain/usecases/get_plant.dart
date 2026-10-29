import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/domain/repositories/plant_repository.dart';

final class GetPlant {
  const GetPlant(this._repository);

  final PlantRepository _repository;

  Future<Result<Plant?>> call(String id) {
    if (id.trim().isEmpty) {
      return Future.value(
        const FailureResult(NotFoundFailure(entity: 'plant')),
      );
    }
    return _repository.getById(id);
  }
}
