import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_garden/core/database/app_database.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/core/files/photo_storage.dart';
import 'package:pocket_garden/features/plants/data/datasources/plant_local_data_source.dart';
import 'package:pocket_garden/features/plants/data/repositories/plant_repository_impl.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant_draft.dart';
import 'package:pocket_garden/features/species_catalog/data/mappers/species_mapper.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';

import '../../../helpers/fixtures.dart';

final class _FakePhotoStorage implements PhotoStorage {
  Result<String> saveResult = const Success('plant_photos/default.jpg');
  Result<void> deleteResult = const Success<void>(null);
  Result<String?> resolveResult = const Success<String?>(null);

  final saveCalls = <String>[];
  final deleteCalls = <String>[];

  @override
  Future<Result<String>> savePhoto({required String sourcePath}) async {
    saveCalls.add(sourcePath);
    return saveResult;
  }

  @override
  Future<Result<void>> deletePhoto(String relativePath) async {
    deleteCalls.add(relativePath);
    return deleteResult;
  }

  @override
  Future<Result<String?>> resolveAbsolutePath(String relativePath) async {
    return resolveResult;
  }
}

void main() {
  late AppDatabase database;
  late _FakePhotoStorage photoStorage;
  late PlantRepositoryImpl repository;
  late DateTime now;

  setUp(() async {
    database = AppDatabase(NativeDatabase.memory());
    photoStorage = _FakePhotoStorage();
    now = DateTime(2026, 1, 1, 12);
    repository = PlantRepositoryImpl(
      PlantLocalDataSource(database),
      photoStorage,
      now: () => now,
    );
    await _seedSpecies(database, monsteraSpecies);
    await _seedSpecies(database, snakePlantSpecies);
  });

  tearDown(() => database.close());

  group('PlantRepositoryImpl', () {
    test('creates a plant, stores its photo and returns the joined model', () async {
      final result = await repository.create(
        defaultDraft,
        photoSourcePath: '/tmp/picked.jpg',
      );

      final plant = result.valueOrNull!;
      expect(plant.id, isNotEmpty);
      expect(plant.nickname, 'Monstera');
      expect(plant.species.id, monsteraSpecies.id);
      expect(plant.species.commonNameEn, monsteraSpecies.commonNameEn);
      expect(plant.location, PlantLocation.indoor);
      expect(plant.notes, 'Near the window');
      expect(plant.photoPath, 'plant_photos/default.jpg');
      expect(plant.createdAt, now);
      expect(plant.updatedAt, now);
      expect(photoStorage.saveCalls, ['/tmp/picked.jpg']);
    });

    test('creates a plant without a photo', () async {
      final result = await repository.create(defaultDraft);

      expect(result.valueOrNull!.photoPath, isNull);
      expect(photoStorage.saveCalls, isEmpty);
    });

    test('returns the photo storage failure and does not insert', () async {
      const failure = StorageFailure(
        cause: 'disk full',
        stackTrace: StackTrace.empty,
      );
      photoStorage.saveResult = const FailureResult(failure);

      final result = await repository.create(
        defaultDraft,
        photoSourcePath: '/tmp/picked.jpg',
      );

      expect(result.failureOrNull, same(failure));
      expect(await _allPlants(database), isEmpty);
    });

    test('getById returns the plant with its species', () async {
      final created = (await repository.create(defaultDraft)).valueOrNull!;

      final result = await repository.getById(created.id);

      expect(result.valueOrNull, created);
    });

    test('getById returns null for an unknown id', () async {
      final result = await repository.getById('missing');

      expect(result, isA<Success<Plant?>>());
      expect(result.valueOrNull, isNull);
    });

    test('watchAll orders plants by most recently updated', () async {
      await repository.create(
        defaultDraft.copyWith(nickname: 'First'),
      );
      now = now.add(const Duration(minutes: 5));
      await repository.create(
        defaultDraft.copyWith(nickname: 'Second'),
      );

      final result = await repository.watchAll().first;

      expect(
        result.valueOrNull!.map((plant) => plant.nickname),
        ['Second', 'First'],
      );
    });

    test('watchById emits the matching plant', () async {
      final created = (await repository.create(defaultDraft)).valueOrNull!;

      final result = await repository.watchById(created.id).first;

      expect(result.valueOrNull, created);
    });

    test('update replaces the photo and deletes the old file', () async {
      final created = (await repository.create(
        defaultDraft,
        photoSourcePath: '/tmp/old.jpg',
      )).valueOrNull!;
      photoStorage.saveResult = const Success('plant_photos/new.jpg');

      final result = await repository.update(
        created.id,
        defaultDraft.copyWith(
          nickname: 'Big Monstera',
          location: PlantLocation.outdoor,
        ),
        newPhotoSourcePath: '/tmp/new.jpg',
      );

      final updated = result.valueOrNull!;
      expect(updated.nickname, 'Big Monstera');
      expect(updated.location, PlantLocation.outdoor);
      expect(updated.photoPath, 'plant_photos/new.jpg');
      expect(photoStorage.deleteCalls, ['plant_photos/default.jpg']);
    });

    test('update can remove the current photo', () async {
      final created = (await repository.create(
        defaultDraft,
        photoSourcePath: '/tmp/old.jpg',
      )).valueOrNull!;

      final result = await repository.update(
        created.id,
        defaultDraft,
        removePhoto: true,
      );

      expect(result.valueOrNull!.photoPath, isNull);
      expect(photoStorage.deleteCalls, ['plant_photos/default.jpg']);
    });

    test('update keeps the photo when no new source is provided', () async {
      final created = (await repository.create(
        defaultDraft,
        photoSourcePath: '/tmp/old.jpg',
      )).valueOrNull!;

      final result = await repository.update(
        created.id,
        defaultDraft.copyWith(nickname: 'Renamed'),
      );

      expect(result.valueOrNull!.photoPath, 'plant_photos/default.jpg');
      expect(photoStorage.deleteCalls, isEmpty);
      expect(photoStorage.saveCalls, ['/tmp/old.jpg']);
    });

    test('update returns NotFoundFailure for an unknown plant', () async {
      final result = await repository.update('missing', defaultDraft);

      expect(result.failureOrNull, isA<NotFoundFailure>());
    });

    test('update leaves the old photo intact when the new save fails', () async {
      final created = (await repository.create(
        defaultDraft,
        photoSourcePath: '/tmp/old.jpg',
      )).valueOrNull!;
      const failure = StorageFailure(
        cause: 'permission denied',
        stackTrace: StackTrace.empty,
      );
      photoStorage.saveResult = const FailureResult(failure);

      final result = await repository.update(
        created.id,
        defaultDraft,
        newPhotoSourcePath: '/tmp/new.jpg',
      );

      expect(result.failureOrNull, same(failure));
      expect(photoStorage.deleteCalls, isEmpty);
      final stored = await repository.getById(created.id);
      expect(stored.valueOrNull!.photoPath, 'plant_photos/default.jpg');
    });

    test('delete removes the row and the photo', () async {
      final created = (await repository.create(
        defaultDraft,
        photoSourcePath: '/tmp/old.jpg',
      )).valueOrNull!;

      final result = await repository.delete(created.id);

      expect(result.isSuccess, isTrue);
      expect(await _allPlants(database), isEmpty);
      expect(photoStorage.deleteCalls, ['plant_photos/default.jpg']);
    });

    test('delete returns NotFoundFailure for an unknown plant', () async {
      final result = await repository.delete('missing');

      expect(result.failureOrNull, isA<NotFoundFailure>());
    });

    test('delete still removes data when photo cleanup fails', () async {
      final created = (await repository.create(
        defaultDraft,
        photoSourcePath: '/tmp/old.jpg',
      )).valueOrNull!;
      photoStorage.deleteResult = FailureResult(
        StorageFailure(
          cause: 'missing file',
          stackTrace: StackTrace.current,
        ),
      );

      final result = await repository.delete(created.id);

      expect(result.isSuccess, isTrue);
      expect(await _allPlants(database), isEmpty);
    });
  });
}

Future<void> _seedSpecies(AppDatabase database, Species species) {
  return database
      .into(database.speciesTable)
      .insert(species.toCompanion());
}

Future<List<PlantRow>> _allPlants(AppDatabase database) {
  return database.select(database.plantsTable).get();
}
