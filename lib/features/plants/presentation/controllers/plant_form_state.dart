import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';

part 'plant_form_state.freezed.dart';

@freezed
abstract class PlantFormState with _$PlantFormState {
  const factory PlantFormState({
    required List<Species> species,
    required String nickname,
    required PlantLocation location,
    required bool isSaving,
    @Default({}) Map<ValidationField, ValidationProblem> fieldErrors,
    @Default(false) bool removePhoto,
    Plant? original,
    String? speciesId,
    String? notes,
    String? existingPhotoPath,
    String? pickedPhotoPath,
    Failure? loadFailure,
    Failure? saveFailure,
  }) = _PlantFormState;

  const PlantFormState._();

  bool get isEditing => original != null;

  String? get previewPhotoPath =>
      pickedPhotoPath ?? (removePhoto ? null : existingPhotoPath);

  bool get hasExistingPhoto =>
      existingPhotoPath != null && !removePhoto && pickedPhotoPath == null;
}
