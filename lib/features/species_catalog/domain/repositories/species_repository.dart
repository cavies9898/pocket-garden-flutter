import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';

abstract interface class SpeciesRepository {
  Future<Result<List<Species>>> getAll();

  Stream<Result<List<Species>>> watchAll();
}
