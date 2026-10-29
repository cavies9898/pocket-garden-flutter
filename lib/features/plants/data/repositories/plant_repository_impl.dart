import 'dart:async';
import 'dart:developer' as developer;

import 'package:drift/drift.dart';
import 'package:pocket_garden/core/database/app_database.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/core/files/photo_storage.dart';
import 'package:pocket_garden/features/plants/data/datasources/plant_local_data_source.dart';
import 'package:pocket_garden/features/plants/data/mappers/plant_mapper.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant_draft.dart';
import 'package:pocket_garden/features/plants/domain/repositories/plant_repository.dart';
import 'package:uuid/uuid.dart';

final class PlantRepositoryImpl implements PlantRepository {
  PlantRepositoryImpl(
    this._localDataSource,
    this._photoStorage, {
    Uuid? uuid,
    DateTime Function()? now,
  }) : _uuid = uuid ?? const Uuid(),
       _now = now ?? DateTime.now;

  final PlantLocalDataSource _localDataSource;
  final PhotoStorage _photoStorage;
  final Uuid _uuid;
  final DateTime Function() _now;

  @override
  Stream<Result<List<Plant>>> watchAll() {
    return _guardStream(_localDataSource.watchAll()).map(
      (result) => result.map(
        (rows) => List<Plant>.unmodifiable(rows.map((row) => row.toDomain())),
      ),
    );
  }

  @override
  Stream<Result<Plant?>> watchById(String id) {
    return _guardStream(_localDataSource.watchById(id))
        .map((result) => result.map((row) => row?.toDomain()));
  }

  @override
  Future<Result<Plant?>> getById(String id) async {
    try {
      return Success((await _localDataSource.getById(id))?.toDomain());
    } on Object catch (error, stackTrace) {
      return FailureResult(
        DatabaseFailure(cause: error, stackTrace: stackTrace),
      );
    }
  }

  @override
  Future<Result<Plant>> create(
    PlantDraft draft, {
    String? photoSourcePath,
  }) async {
    String? savedPhotoPath;
    if (photoSourcePath != null) {
      final saved = await _photoStorage.savePhoto(sourcePath: photoSourcePath);
      switch (saved) {
        case FailureResult(:final failure):
          return FailureResult(failure);
        case Success(:final value):
          savedPhotoPath = value;
      }
    }

    final now = _now();
    final id = _uuid.v4();
    try {
      final inserted = await _localDataSource.insert(
        PlantsTableCompanion.insert(
          id: id,
          nickname: draft.nickname,
          speciesId: draft.speciesId,
          location: draft.location,
          photoPath: Value(savedPhotoPath),
          notes: Value(draft.notes),
          createdAt: now,
          updatedAt: now,
        ),
      );
      if (inserted == 0) {
        await _deletePhotoBestEffort(savedPhotoPath);
        return const FailureResult(
          DatabaseFailure(
            cause: 'No plant row was inserted',
            stackTrace: StackTrace.empty,
          ),
        );
      }

      final created = await _localDataSource.getById(id);
      if (created == null) {
        await _deletePhotoBestEffort(savedPhotoPath);
        return const FailureResult(NotFoundFailure(entity: 'plant'));
      }
      return Success(created.toDomain());
    } on Object catch (error, stackTrace) {
      await _deletePhotoBestEffort(savedPhotoPath);
      return FailureResult(
        DatabaseFailure(cause: error, stackTrace: stackTrace),
      );
    }
  }

  @override
  Future<Result<Plant>> update(
    String id,
    PlantDraft draft, {
    String? newPhotoSourcePath,
    bool removePhoto = false,
  }) async {
    final existing = await getById(id);
    switch (existing) {
      case FailureResult(:final failure):
        return FailureResult(failure);
      case Success(:final value):
        if (value == null) {
          return const FailureResult(NotFoundFailure(entity: 'plant'));
        }

        String? newPhotoPath;
        if (newPhotoSourcePath != null) {
          final saved = await _photoStorage.savePhoto(
            sourcePath: newPhotoSourcePath,
          );
          switch (saved) {
            case FailureResult(:final failure):
              return FailureResult(failure);
            case Success(:final value):
              newPhotoPath = value;
          }
        }

        final finalPhotoPath =
            newPhotoPath ?? (removePhoto ? null : value.photoPath);
        try {
          final updatedRows = await _localDataSource.updatePlant(
            PlantsTableCompanion(
              nickname: Value(draft.nickname),
              speciesId: Value(draft.speciesId),
              location: Value(draft.location),
              photoPath: Value(finalPhotoPath),
              notes: Value(draft.notes),
              updatedAt: Value(_now()),
            ),
            id,
          );
          if (updatedRows == 0) {
            await _deletePhotoBestEffort(newPhotoPath);
            return const FailureResult(NotFoundFailure(entity: 'plant'));
          }

          if (value.photoPath != finalPhotoPath) {
            await _deletePhotoBestEffort(value.photoPath);
          }

          final updated = await _localDataSource.getById(id);
          if (updated == null) {
            return const FailureResult(NotFoundFailure(entity: 'plant'));
          }
          return Success(updated.toDomain());
        } on Object catch (error, stackTrace) {
          await _deletePhotoBestEffort(newPhotoPath);
          return FailureResult(
            DatabaseFailure(cause: error, stackTrace: stackTrace),
          );
        }
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    final existing = await getById(id);
    switch (existing) {
      case FailureResult(:final failure):
        return FailureResult(failure);
      case Success(:final value):
        if (value == null) {
          return const FailureResult(NotFoundFailure(entity: 'plant'));
        }

        try {
          final deleted = await _localDataSource.deleteById(id);
          if (deleted == 0) {
            return const FailureResult(NotFoundFailure(entity: 'plant'));
          }
          await _deletePhotoBestEffort(value.photoPath);
          return const Success(null);
        } on Object catch (error, stackTrace) {
          return FailureResult(
            DatabaseFailure(cause: error, stackTrace: stackTrace),
          );
        }
    }
  }

  Stream<Result<T>> _guardStream<T>(Stream<T> source) {
    return source.transform(
      StreamTransformer<T, Result<T>>.fromHandlers(
        handleData: (value, sink) => sink.add(Success(value)),
        handleError: (error, stackTrace, sink) => sink.add(
          FailureResult(DatabaseFailure(cause: error, stackTrace: stackTrace)),
        ),
      ),
    );
  }

  Future<void> _deletePhotoBestEffort(String? relativePath) async {
    if (relativePath == null) {
      return;
    }
    final result = await _photoStorage.deletePhoto(relativePath);
    if (result case FailureResult(:final failure)) {
      // The database change already succeeded. Log cleanup issues instead of
      // telling the user their save failed when it did not.
      developer.log(
        'Could not delete plant photo $relativePath',
        name: 'PlantRepository',
        error: failure,
      );
    }
  }
}
