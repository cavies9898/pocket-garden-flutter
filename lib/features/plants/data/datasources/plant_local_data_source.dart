import 'package:drift/drift.dart';
import 'package:pocket_garden/core/database/app_database.dart';

final class PlantWithSpecies {
  const PlantWithSpecies({required this.plant, required this.species});

  final PlantRow plant;
  final SpeciesRow species;
}

final class PlantLocalDataSource {
  PlantLocalDataSource(this._database);

  final AppDatabase _database;

  Stream<List<PlantWithSpecies>> watchAll() {
    final query =
        _database.select(_database.plantsTable).join([
          innerJoin(
            _database.speciesTable,
            _database.speciesTable.id.equalsExp(
              _database.plantsTable.speciesId,
            ),
          ),
        ])..orderBy([
          OrderingTerm.desc(_database.plantsTable.updatedAt),
          OrderingTerm.asc(_database.plantsTable.nickname),
        ]);

    return query.watch().map(
      (rows) => List<PlantWithSpecies>.unmodifiable(rows.map(_readJoinRow)),
    );
  }

  Stream<PlantWithSpecies?> watchById(String id) {
    final query = _singleQuery(id);
    return query.watchSingleOrNull().map(
      (row) => row == null ? null : _readJoinRow(row),
    );
  }

  Future<PlantWithSpecies?> getById(String id) async {
    final row = await _singleQuery(id).getSingleOrNull();
    return row == null ? null : _readJoinRow(row);
  }

  Future<int> insert(PlantsTableCompanion plant) =>
      _database.into(_database.plantsTable).insert(plant);

  Future<int> updatePlant(PlantsTableCompanion plant, String id) {
    return (_database.update(
      _database.plantsTable,
    )..where((table) => table.id.equals(id))).write(plant);
  }

  Future<int> deleteById(String id) {
    return (_database.delete(
      _database.plantsTable,
    )..where((table) => table.id.equals(id))).go();
  }

  SingleOrNullSelectable<TypedResult> _singleQuery(String id) {
    return _database.select(_database.plantsTable).join([
      innerJoin(
        _database.speciesTable,
        _database.speciesTable.id.equalsExp(_database.plantsTable.speciesId),
      ),
    ])..where(_database.plantsTable.id.equals(id));
  }

  PlantWithSpecies _readJoinRow(TypedResult row) {
    return PlantWithSpecies(
      plant: row.readTable(_database.plantsTable),
      species: row.readTable(_database.speciesTable),
    );
  }
}
