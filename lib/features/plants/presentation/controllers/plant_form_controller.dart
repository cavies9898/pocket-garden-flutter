import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant_draft.dart';
import 'package:pocket_garden/features/plants/presentation/controllers/plant_form_state.dart';
import 'package:pocket_garden/features/plants/presentation/providers/plant_providers.dart';
import 'package:pocket_garden/features/species_catalog/presentation/providers/species_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'plant_form_controller.g.dart';

@riverpod
class PlantFormController extends _$PlantFormController {
  @override
  Future<PlantFormState> build(String? plantId) async {
    final catalogResult = await ref.watch(getSpeciesCatalogUseCaseProvider)();
    final species = switch (catalogResult) {
      FailureResult() => null,
      Success(:final value) => value,
    };
    if (species == null) {
      return PlantFormState(
        species: const [],
        nickname: '',
        location: PlantLocation.indoor,
        isSaving: false,
        loadFailure: catalogResult.failureOrNull,
      );
    }
    if (species.isEmpty) {
      return PlantFormState(
        species: const [],
        nickname: '',
        location: PlantLocation.indoor,
        isSaving: false,
        loadFailure: DataFailure(
          resource: 'species_catalog',
          cause: StateError('The seeded catalog is empty'),
        ),
      );
    }

    Plant? plant;
    if (plantId != null) {
      final plantResult = await ref.watch(getPlantUseCaseProvider)(plantId);
      switch (plantResult) {
        case FailureResult(:final failure):
          return PlantFormState(
            species: species,
            nickname: '',
            location: PlantLocation.indoor,
            isSaving: false,
            loadFailure: failure,
          );
        case Success(:final value):
          plant = value;
      }
      if (plant == null) {
        return PlantFormState(
          species: species,
          nickname: '',
          location: PlantLocation.indoor,
          isSaving: false,
          loadFailure: const NotFoundFailure(entity: 'plant'),
        );
      }
    }

    return PlantFormState(
      species: species,
      nickname: plant?.nickname ?? '',
      location: plant?.location ?? PlantLocation.indoor,
      speciesId: plant?.species.id ?? species.first.id,
      notes: plant?.notes,
      existingPhotoPath: plant?.photoPath,
      original: plant,
      isSaving: false,
    );
  }

  void updateNickname(String nickname) {
    _update(
      (current) => current.copyWith(
        nickname: nickname,
        fieldErrors: _withoutField(current, ValidationField.nickname),
        saveFailure: null,
      ),
    );
  }

  void updateSpecies(String? speciesId) {
    _update(
      (current) => current.copyWith(
        speciesId: speciesId,
        fieldErrors: _withoutField(current, ValidationField.speciesId),
        saveFailure: null,
      ),
    );
  }

  void updateLocation(PlantLocation location) {
    _update((current) => current.copyWith(location: location));
  }

  void updateNotes(String notes) {
    _update(
      (current) => current.copyWith(
        notes: notes,
        fieldErrors: _withoutField(current, ValidationField.notes),
        saveFailure: null,
      ),
    );
  }

  void setPickedPhoto(String sourcePath) {
    _update(
      (current) => current.copyWith(
        pickedPhotoPath: sourcePath,
        removePhoto: false,
        saveFailure: null,
      ),
    );
  }

  void clearPhoto() {
    _update(
      (current) => current.copyWith(
        pickedPhotoPath: null,
        removePhoto: true,
        saveFailure: null,
      ),
    );
  }

  void retryLoad() => ref.invalidateSelf();

  Future<Result<Plant>> save() async {
    final current = state.value;
    if (current == null || current.isSaving) {
      return const FailureResult(
        UnexpectedFailure(
          cause: 'The form is not ready to save',
          stackTrace: StackTrace.empty,
        ),
      );
    }

    final draft = PlantDraft(
      nickname: current.nickname,
      speciesId: current.speciesId ?? '',
      location: current.location,
      notes: current.notes,
    );
    state = AsyncData(
      current.copyWith(
        isSaving: true,
        saveFailure: null,
        fieldErrors: const {},
      ),
    );

    final original = current.original;
    final result = original != null
        ? await ref.read(updatePlantUseCaseProvider)(
            original.id,
            draft,
            newPhotoSourcePath: current.pickedPhotoPath,
            removePhoto: current.removePhoto,
          )
        : await ref.read(createPlantUseCaseProvider)(
            draft,
            photoSourcePath: current.pickedPhotoPath,
          );

    switch (result) {
      case Success(:final value):
        state = AsyncData(current.copyWith(isSaving: false));
        return Success(value);
      case FailureResult(:final failure):
        final fieldError = switch (failure) {
          ValidationFailure(:final field, :final problem) => MapEntry(
            field,
            problem,
          ),
          _ => null,
        };
        state = AsyncData(
          current.copyWith(
            isSaving: false,
            fieldErrors: fieldError == null
                ? const {}
                : {fieldError.key: fieldError.value},
            saveFailure: fieldError == null ? failure : null,
          ),
        );
        return FailureResult(failure);
    }
  }

  void _update(PlantFormState Function(PlantFormState current) transform) {
    final current = state.value;
    if (current == null || current.isSaving) {
      return;
    }
    state = AsyncData(transform(current));
  }

  Map<ValidationField, ValidationProblem> _withoutField(
    PlantFormState current,
    ValidationField field,
  ) {
    if (!current.fieldErrors.containsKey(field)) {
      return current.fieldErrors;
    }
    return Map.of(current.fieldErrors)..remove(field);
  }
}
