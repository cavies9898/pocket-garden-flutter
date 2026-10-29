import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/species_catalog/data/datasources/species_asset_data_source.dart';
import 'package:pocket_garden/features/species_catalog/data/datasources/species_local_data_source.dart';
import 'package:pocket_garden/features/species_catalog/data/mappers/species_mapper.dart';

/// Seeds the bundled species catalog. The upsert strategy makes this safe to
/// run on every launch: repeated runs converge to the same catalog without
/// invalidating plants that reference a species.
final class SpeciesCatalogSeeder {
  const SpeciesCatalogSeeder(this._catalogSource, this._localDataSource);

  final SpeciesCatalogSource _catalogSource;
  final SpeciesLocalDataSource _localDataSource;

  Future<Result<void>> call() async {
    final catalog = await _catalogSource.loadCatalog();
    return switch (catalog) {
      FailureResult(:final failure) => FailureResult(failure),
      Success(:final value) => await _localDataSource.upsertAll(
        value.map((species) => species.toCompanion()).toList(growable: false),
      ),
    };
  }
}
