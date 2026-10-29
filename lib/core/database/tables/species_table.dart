import 'package:drift/drift.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';

@DataClassName('SpeciesRow')
class SpeciesTable extends Table {
  @override
  String get tableName => 'species';

  TextColumn get id => text()();

  TextColumn get commonNameEn => text()();

  TextColumn get commonNameEs => text()();

  TextColumn get scientificName => text()();

  TextColumn get descriptionEn => text()();

  TextColumn get descriptionEs => text()();

  IntColumn get wateringFrequencyDays => integer()();

  IntColumn get fertilizingFrequencyDays => integer()();

  TextColumn get lightRequirement => textEnum<LightRequirement>()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
