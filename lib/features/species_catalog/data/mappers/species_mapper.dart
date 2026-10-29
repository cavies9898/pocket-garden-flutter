import 'package:pocket_garden/core/database/app_database.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';

extension SpeciesRowMapper on SpeciesRow {
  Species toDomain() => Species(
    id: id,
    commonNameEn: commonNameEn,
    commonNameEs: commonNameEs,
    scientificName: scientificName,
    descriptionEn: descriptionEn,
    descriptionEs: descriptionEs,
    wateringFrequencyDays: wateringFrequencyDays,
    fertilizingFrequencyDays: fertilizingFrequencyDays,
    lightRequirement: lightRequirement,
  );
}

extension SpeciesTableCompanionMapper on Species {
  SpeciesTableCompanion toCompanion() => SpeciesTableCompanion.insert(
    id: id,
    commonNameEn: commonNameEn,
    commonNameEs: commonNameEs,
    scientificName: scientificName,
    descriptionEn: descriptionEn,
    descriptionEs: descriptionEs,
    wateringFrequencyDays: wateringFrequencyDays,
    fertilizingFrequencyDays: fertilizingFrequencyDays,
    lightRequirement: lightRequirement,
  );
}
