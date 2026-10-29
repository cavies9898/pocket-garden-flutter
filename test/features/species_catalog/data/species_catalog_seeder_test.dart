import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_garden/core/database/app_database.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/species_catalog/data/datasources/species_asset_data_source.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/species_catalog/data/datasources/species_local_data_source.dart';
import 'package:pocket_garden/features/species_catalog/data/seed/species_catalog_seeder.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';

import '../../../helpers/fixtures.dart';

final class _FakeCatalogSource implements SpeciesCatalogSource {
  _FakeCatalogSource(this.result);

  Result<List<Species>> result;
  int loadCount = 0;

  @override
  Future<Result<List<Species>>> loadCatalog() async {
    loadCount++;
    return result;
  }
}

void main() {
  late AppDatabase database;
  late SpeciesLocalDataSource localDataSource;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    localDataSource = SpeciesLocalDataSource(database);
  });

  tearDown(() => database.close());

  group('SpeciesCatalogSeeder', () {
    test('inserts the bundled catalog into an empty database', () async {
      final source = _FakeCatalogSource(
        const Success([monsteraSpecies, snakePlantSpecies]),
      );
      final seeder = SpeciesCatalogSeeder(source, localDataSource);

      final result = await seeder();

      expect(result.isSuccess, isTrue);
      expect(source.loadCount, 1);
      final rows = await _allSpecies(database);
      expect(rows.map((row) => row.id), containsAll(<String>[
        monsteraSpecies.id,
        snakePlantSpecies.id,
      ]));
    });

    test('is idempotent and converges values on every launch', () async {
      final source = _FakeCatalogSource(const Success([monsteraSpecies]));
      final seeder = SpeciesCatalogSeeder(source, localDataSource);

      await seeder();
      final firstRows = await _allSpecies(database);

      source.result = Success([
        monsteraSpecies.copyWith(
          wateringFrequencyDays: 10,
          descriptionEn: 'Updated description',
        ),
      ]);
      await seeder();

      final secondRows = await _allSpecies(database);
      expect(secondRows, hasLength(1));
      expect(secondRows.single.id, firstRows.single.id);
      expect(secondRows.single.wateringFrequencyDays, 10);
      expect(secondRows.single.descriptionEn, 'Updated description');
    });

    test('keeps existing plants valid when re-seeding', () async {
      final source = _FakeCatalogSource(const Success([monsteraSpecies]));
      final seeder = SpeciesCatalogSeeder(source, localDataSource);
      await seeder();

      await database.into(database.plantsTable).insert(
        PlantsTableCompanion.insert(
          id: 'plant-1',
          nickname: 'Monstera',
          speciesId: monsteraSpecies.id,
          location: PlantLocation.indoor,
          createdAt: DateTime.utc(2026, 1, 1),
          updatedAt: DateTime.utc(2026, 1, 1),
        ),
      );

      await seeder();

      final plants = await database.select(database.plantsTable).get();
      expect(plants, hasLength(1));
    });

    test('returns the catalog source failure without writing', () async {
      const failure = DataFailure(
        resource: 'assets/data/species_catalog.json',
        cause: 'invalid json',
      );
      final source = _FakeCatalogSource(const FailureResult(failure));
      final seeder = SpeciesCatalogSeeder(source, localDataSource);

      final result = await seeder();

      expect(result.failureOrNull, same(failure));
      expect(await _allSpecies(database), isEmpty);
    });

    test('accepts an empty catalog', () async {
      final source = _FakeCatalogSource(const Success(<Species>[]));
      final seeder = SpeciesCatalogSeeder(source, localDataSource);

      final result = await seeder();

      expect(result.isSuccess, isTrue);
      expect(await _allSpecies(database), isEmpty);
    });
  });
}

Future<List<SpeciesRow>> _allSpecies(AppDatabase database) {
  return database.select(database.speciesTable).get();
}
