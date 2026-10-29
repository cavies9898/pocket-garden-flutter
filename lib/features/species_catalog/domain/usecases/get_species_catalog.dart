import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';
import 'package:pocket_garden/features/species_catalog/domain/repositories/species_repository.dart';

final class GetSpeciesCatalog {
  const GetSpeciesCatalog(this._repository);

  final SpeciesRepository _repository;

  Future<Result<List<Species>>> call() => _repository.getAll();
}

final class WatchSpeciesCatalog {
  const WatchSpeciesCatalog(this._repository);

  final SpeciesRepository _repository;

  Stream<Result<List<Species>>> call() => _repository.watchAll();
}
