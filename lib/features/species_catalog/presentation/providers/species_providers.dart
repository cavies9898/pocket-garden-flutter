import 'package:pocket_garden/core/database/database_providers.dart';
import 'package:pocket_garden/features/species_catalog/data/datasources/species_asset_data_source.dart';
import 'package:pocket_garden/features/species_catalog/data/datasources/species_local_data_source.dart';
import 'package:pocket_garden/features/species_catalog/data/repositories/species_repository_impl.dart';
import 'package:pocket_garden/features/species_catalog/data/seed/species_catalog_seeder.dart';
import 'package:pocket_garden/features/species_catalog/domain/repositories/species_repository.dart';
import 'package:pocket_garden/features/species_catalog/domain/usecases/get_species_catalog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'species_providers.g.dart';

@Riverpod(keepAlive: true)
SpeciesCatalogSource speciesCatalogSource(Ref ref) => SpeciesAssetDataSource();

@Riverpod(keepAlive: true)
SpeciesLocalDataSource speciesLocalDataSource(Ref ref) =>
    SpeciesLocalDataSource(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
SpeciesRepository speciesRepository(Ref ref) =>
    SpeciesRepositoryImpl(ref.watch(speciesLocalDataSourceProvider));

@Riverpod(keepAlive: true)
GetSpeciesCatalog getSpeciesCatalogUseCase(Ref ref) =>
    GetSpeciesCatalog(ref.watch(speciesRepositoryProvider));

@Riverpod(keepAlive: true)
WatchSpeciesCatalog watchSpeciesCatalogUseCase(Ref ref) =>
    WatchSpeciesCatalog(ref.watch(speciesRepositoryProvider));

@Riverpod(keepAlive: true)
SpeciesCatalogSeeder speciesCatalogSeeder(Ref ref) => SpeciesCatalogSeeder(
  ref.watch(speciesCatalogSourceProvider),
  ref.watch(speciesLocalDataSourceProvider),
);
