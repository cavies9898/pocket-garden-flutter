import 'dart:async';

import 'package:drift/drift.dart';
import 'package:pocket_garden/core/database/app_database.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';

final class SpeciesLocalDataSource {
  SpeciesLocalDataSource(this._database);

  final AppDatabase _database;

  Future<Result<List<SpeciesRow>>> getAll() async {
    try {
      final query = _database.select(_database.speciesTable)
        ..orderBy([(table) => OrderingTerm.asc(table.commonNameEn)]);
      return Success(await query.get());
    } on Object catch (error, stackTrace) {
      return FailureResult(
        DatabaseFailure(cause: error, stackTrace: stackTrace),
      );
    }
  }

  Stream<Result<List<SpeciesRow>>> watchAll() {
    final query = _database.select(_database.speciesTable)
      ..orderBy([(table) => OrderingTerm.asc(table.commonNameEn)]);
    return query.watch().transform(
      StreamTransformer<
        List<SpeciesRow>,
        Result<List<SpeciesRow>>
      >.fromHandlers(
        handleData: (rows, sink) => sink.add(Success(rows)),
        handleError: (error, stackTrace, sink) => sink.add(
          FailureResult(DatabaseFailure(cause: error, stackTrace: stackTrace)),
        ),
      ),
    );
  }

  Future<Result<void>> upsertAll(List<SpeciesTableCompanion> entries) async {
    try {
      await _database.batch((batch) {
        batch.insertAllOnConflictUpdate(_database.speciesTable, entries);
      });
      return const Success(null);
    } on Object catch (error, stackTrace) {
      return FailureResult(
        DatabaseFailure(cause: error, stackTrace: stackTrace),
      );
    }
  }
}
