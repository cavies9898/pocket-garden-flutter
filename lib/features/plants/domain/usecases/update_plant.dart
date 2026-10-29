import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant_draft.dart';
import 'package:pocket_garden/features/plants/domain/repositories/plant_repository.dart';
import 'package:pocket_garden/features/plants/domain/usecases/plant_draft_validator.dart';

final class UpdatePlant {
  const UpdatePlant(this._repository, this._validator);

  final PlantRepository _repository;
  final PlantDraftValidator _validator;

  Future<Result<Plant>> call(
    String id,
    PlantDraft draft, {
    String? newPhotoSourcePath,
    bool removePhoto = false,
  }) {
    if (id.trim().isEmpty) {
      return Future.value(
        const FailureResult(NotFoundFailure(entity: 'plant')),
      );
    }

    final validated = _validator(draft);
    return switch (validated) {
      FailureResult(:final failure) => Future.value(FailureResult(failure)),
      Success(:final value) => _repository.update(
        id,
        value,
        newPhotoSourcePath: newPhotoSourcePath,
        removePhoto: removePhoto,
      ),
    };
  }
}
