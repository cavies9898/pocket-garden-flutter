import 'package:drift/drift.dart';
import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/database/tables/species_table.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';

@DataClassName('PlantRow')
class PlantsTable extends Table {
  @override
  String get tableName => 'plants';

  TextColumn get id => text()();

  TextColumn get nickname =>
      text().withLength(min: 1, max: AppConstants.maxNicknameLength)();

  TextColumn get speciesId => text().references(SpeciesTable, #id)();

  TextColumn get photoPath => text().nullable()();

  TextColumn get location => textEnum<PlantLocation>()();

  TextColumn get notes =>
      text().withLength(max: AppConstants.maxNotesLength).nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
