import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/species_catalog/data/datasources/species_local_data_source.dart';
import 'package:pocket_garden/features/species_catalog/data/mappers/species_mapper.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';
import 'package:pocket_garden/features/species_catalog/domain/repositories/species_repository.dart';

final class SpeciesRepositoryImpl implements SpeciesRepository {
  const SpeciesRepositoryImpl(this._localDataSource);

  final SpeciesLocalDataSource _localDataSource;

  @override
  Future<Result<List<Species>>> getAll() async {
    final result = await _localDataSource.getAll();
    return result.map(
      (rows) => List<Species>.unmodifiable(rows.map((row) => row.toDomain())),
    );
  }

  @override
  Stream<Result<List<Species>>> watchAll() {
    return _localDataSource.watchAll().map(
      (result) => result.map(
        (rows) => List<Species>.unmodifiable(rows.map((row) => row.toDomain())),
      ),
    );
  }
}
