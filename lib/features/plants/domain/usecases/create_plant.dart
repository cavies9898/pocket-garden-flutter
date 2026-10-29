import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant_draft.dart';
import 'package:pocket_garden/features/plants/domain/repositories/plant_repository.dart';
import 'package:pocket_garden/features/plants/domain/usecases/plant_draft_validator.dart';

final class CreatePlant {
  const CreatePlant(this._repository, this._validator);

  final PlantRepository _repository;
  final PlantDraftValidator _validator;

  Future<Result<Plant>> call(PlantDraft draft, {String? photoSourcePath}) {
    final validated = _validator(draft);
    return switch (validated) {
      FailureResult(:final failure) => Future.value(FailureResult(failure)),
      Success(:final value) => _repository.create(
        value,
        photoSourcePath: photoSourcePath,
      ),
    };
  }
}
