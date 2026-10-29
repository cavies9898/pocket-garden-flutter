import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';

part 'plant.freezed.dart';

enum PlantLocation { indoor, outdoor }

/// A plant that belongs to the user. It includes its catalog species so the UI
/// can render care information from a single reactive source.
@freezed
abstract class Plant with _$Plant {
  const factory Plant({
    required String id,
    required String nickname,
    required Species species,
    required PlantLocation location,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? photoPath,
    String? notes,
  }) = _Plant;
}
