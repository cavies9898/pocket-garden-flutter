import 'package:pocket_garden/features/plants/data/datasources/plant_local_data_source.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/species_catalog/data/mappers/species_mapper.dart';

extension PlantWithSpeciesMapper on PlantWithSpecies {
  Plant toDomain() => Plant(
    id: plant.id,
    nickname: plant.nickname,
    species: species.toDomain(),
    location: plant.location,
    createdAt: plant.createdAt,
    updatedAt: plant.updatedAt,
    photoPath: plant.photoPath,
    notes: plant.notes,
  );
}
