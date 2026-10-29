import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant_draft.dart';

/// The local repository contract. A future remote datasource can decorate this
/// interface without changing domain consumers or presentation.
abstract interface class PlantRepository {
  Stream<Result<List<Plant>>> watchAll();

  Stream<Result<Plant?>> watchById(String id);

  Future<Result<Plant?>> getById(String id);

  Future<Result<Plant>> create(PlantDraft draft, {String? photoSourcePath});

  Future<Result<Plant>> update(
    String id,
    PlantDraft draft, {
    String? newPhotoSourcePath,
    bool removePhoto = false,
  });

  Future<Result<void>> delete(String id);
}
