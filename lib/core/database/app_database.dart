import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/database/tables/plants_table.dart';
import 'package:pocket_garden/core/database/tables/species_table.dart';
// The generated part file references the column enum types by name, and Dart
// imports are not transitive, so they must be imported by this library too.
import 'package:pocket_garden/features/plants/domain/entities/plant.dart'
    show PlantLocation;
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart'
    show LightRequirement;

part 'app_database.g.dart';

@DriftDatabase(tables: [SpeciesTable, PlantsTable])
final class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  AppDatabase.defaults()
    : super(driftDatabase(name: AppConstants.databaseName));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    beforeOpen: (details) async {
      // SQLite disables foreign keys per connection. Enforcing species
      // integrity is part of the database contract, not just validation.
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
