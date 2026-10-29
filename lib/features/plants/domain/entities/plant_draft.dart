import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';

part 'plant_draft.freezed.dart';

/// User-editable plant fields. Photo management is intentionally separate:
/// a photo source path is infrastructure input, not domain data.
@freezed
abstract class PlantDraft with _$PlantDraft {
  const factory PlantDraft({
    required String nickname,
    required String speciesId,
    required PlantLocation location,
    String? notes,
  }) = _PlantDraft;
}
