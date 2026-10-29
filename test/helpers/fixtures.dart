import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant_draft.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';

const monsteraSpecies = Species(
  id: 'monstera-deliciosa',
  commonNameEn: 'Monstera',
  commonNameEs: 'Monstera',
  scientificName: 'Monstera deliciosa',
  descriptionEn: 'A tropical climber with iconic split leaves.',
  descriptionEs: 'Una trepadora tropical de hojas emblemáticas.',
  wateringFrequencyDays: 7,
  fertilizingFrequencyDays: 30,
  lightRequirement: LightRequirement.brightIndirect,
);

const snakePlantSpecies = Species(
  id: 'sansevieria-trifasciata',
  commonNameEn: 'Snake plant',
  commonNameEs: 'Lengua de suegra',
  scientificName: 'Dracaena trifasciata',
  descriptionEn: 'A forgiving plant that tolerates low light.',
  descriptionEs: 'Una planta resistente que tolera poca luz.',
  wateringFrequencyDays: 14,
  fertilizingFrequencyDays: 60,
  lightRequirement: LightRequirement.low,
);

const defaultDraft = PlantDraft(
  nickname: 'Monstera',
  speciesId: 'monstera-deliciosa',
  location: PlantLocation.indoor,
  notes: 'Near the window',
);

Plant buildPlant({
  String id = 'plant-1',
  String nickname = 'Monstera',
  Species species = monsteraSpecies,
  PlantLocation location = PlantLocation.indoor,
  String? photoPath,
  String? notes,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final timestamp = createdAt ?? DateTime.utc(2026, 1, 1);
  return Plant(
    id: id,
    nickname: nickname,
    species: species,
    location: location,
    createdAt: timestamp,
    updatedAt: updatedAt ?? timestamp,
    photoPath: photoPath,
    notes: notes,
  );
}
