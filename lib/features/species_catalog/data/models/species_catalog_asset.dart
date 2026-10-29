import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';

part 'species_catalog_asset.freezed.dart';
part 'species_catalog_asset.g.dart';

@freezed
abstract class SpeciesCatalogAsset with _$SpeciesCatalogAsset {
  const factory SpeciesCatalogAsset({
    required int version,
    required List<SpeciesSeedEntry> species,
  }) = _SpeciesCatalogAsset;

  factory SpeciesCatalogAsset.fromJson(Map<String, Object?> json) =>
      _$SpeciesCatalogAssetFromJson(json);
}

@freezed
abstract class SpeciesSeedEntry with _$SpeciesSeedEntry {
  const factory SpeciesSeedEntry({
    required String id,
    @JsonKey(name: 'common_name_en') required String commonNameEn,
    @JsonKey(name: 'common_name_es') required String commonNameEs,
    @JsonKey(name: 'scientific_name') required String scientificName,
    @JsonKey(name: 'description_en') required String descriptionEn,
    @JsonKey(name: 'description_es') required String descriptionEs,
    @JsonKey(name: 'watering_frequency_days')
    required int wateringFrequencyDays,
    @JsonKey(name: 'fertilizing_frequency_days')
    required int fertilizingFrequencyDays,
    @JsonKey(name: 'light_requirement') required String lightRequirement,
  }) = _SpeciesSeedEntry;

  factory SpeciesSeedEntry.fromJson(Map<String, Object?> json) =>
      _$SpeciesSeedEntryFromJson(json);
}

extension SpeciesCatalogValidation on SpeciesCatalogAsset {
  /// Validates the asset before it reaches SQLite. A malformed or unsupported
  /// catalog is a typed data failure, never a crash on startup.
  Result<List<Species>> toDomain() {
    if (version != AppConstants.speciesCatalogSchemaVersion) {
      return FailureResult(
        DataFailure(
          resource: AppConstants.speciesCatalogAsset,
          cause: FormatException(
            'Unsupported species catalog version: $version',
          ),
        ),
      );
    }
    if (species.isEmpty) {
      return const FailureResult(
        DataFailure(
          resource: AppConstants.speciesCatalogAsset,
          cause: FormatException('Species catalog is empty'),
        ),
      );
    }

    final ids = <String>{};
    final domainSpecies = <Species>[];
    for (final entry in species) {
      final parsed = entry._toDomain();
      if (parsed case FailureResult(:final failure)) {
        return FailureResult(failure);
      }
      final domainEntry = (parsed as Success<Species>).value;
      if (!ids.add(domainEntry.id)) {
        return FailureResult(
          DataFailure(
            resource: AppConstants.speciesCatalogAsset,
            cause: FormatException('Duplicate species id: ${domainEntry.id}'),
          ),
        );
      }
      domainSpecies.add(domainEntry);
    }
    return Success(List.unmodifiable(domainSpecies));
  }
}

extension SpeciesSeedEntryValidation on SpeciesSeedEntry {
  Result<Species> _toDomain() {
    final textFields = <String>[
      id,
      commonNameEn,
      commonNameEs,
      scientificName,
      descriptionEn,
      descriptionEs,
    ];
    if (textFields.any((value) => value.trim().isEmpty)) {
      return FailureResult(
        DataFailure(
          resource: AppConstants.speciesCatalogAsset,
          cause: FormatException('Species $id contains empty required text'),
        ),
      );
    }
    if (!_isValidInterval(wateringFrequencyDays) ||
        !_isValidInterval(fertilizingFrequencyDays)) {
      return FailureResult(
        DataFailure(
          resource: AppConstants.speciesCatalogAsset,
          cause: FormatException('Species $id has an invalid care interval'),
        ),
      );
    }

    final light = switch (lightRequirement) {
      'low' => LightRequirement.low,
      'medium' => LightRequirement.medium,
      'bright_indirect' => LightRequirement.brightIndirect,
      'full_sun' => LightRequirement.fullSun,
      _ => null,
    };
    if (light == null) {
      return FailureResult(
        DataFailure(
          resource: AppConstants.speciesCatalogAsset,
          cause: FormatException(
            'Species $id has an invalid light requirement',
          ),
        ),
      );
    }

    return Success(
      Species(
        id: id,
        commonNameEn: commonNameEn,
        commonNameEs: commonNameEs,
        scientificName: scientificName,
        descriptionEn: descriptionEn,
        descriptionEs: descriptionEs,
        wateringFrequencyDays: wateringFrequencyDays,
        fertilizingFrequencyDays: fertilizingFrequencyDays,
        lightRequirement: light,
      ),
    );
  }

  bool _isValidInterval(int days) => days >= 1 && days <= 365;
}
