import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/species_catalog/data/models/species_catalog_asset.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';

abstract interface class SpeciesCatalogSource {
  Future<Result<List<Species>>> loadCatalog();
}

/// Reads the bundled catalog. The schema version and every field are validated
/// before seeding, so a damaged asset fails visibly and safely.
final class SpeciesAssetDataSource implements SpeciesCatalogSource {
  SpeciesAssetDataSource({AssetBundle? bundle})
    : _bundle = bundle ?? rootBundle;

  final AssetBundle _bundle;

  @override
  Future<Result<List<Species>>> loadCatalog() async {
    try {
      final raw = await _bundle.loadString(AppConstants.speciesCatalogAsset);
      final decoded = jsonDecode(raw);
      if (decoded is! Map<Object?, Object?>) {
        return const FailureResult(
          DataFailure(
            resource: AppConstants.speciesCatalogAsset,
            cause: FormatException('Catalog must be a JSON object'),
          ),
        );
      }

      final json = <String, Object?>{};
      for (final entry in decoded.entries) {
        final key = entry.key;
        if (key is! String) {
          return const FailureResult(
            DataFailure(
              resource: AppConstants.speciesCatalogAsset,
              cause: FormatException('Catalog keys must be strings'),
            ),
          );
        }
        json[key] = entry.value;
      }

      return SpeciesCatalogAsset.fromJson(json).toDomain();
    } on FormatException catch (error) {
      return FailureResult(
        DataFailure(resource: AppConstants.speciesCatalogAsset, cause: error),
      );
    } on CheckedFromJsonException catch (error) {
      return FailureResult(
        DataFailure(resource: AppConstants.speciesCatalogAsset, cause: error),
      );
    } on Exception catch (error) {
      return FailureResult(
        DataFailure(resource: AppConstants.speciesCatalogAsset, cause: error),
      );
    }
  }
}
