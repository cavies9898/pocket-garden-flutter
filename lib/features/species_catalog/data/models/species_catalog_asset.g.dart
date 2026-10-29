// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_catalog_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpeciesCatalogAsset _$SpeciesCatalogAssetFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SpeciesCatalogAsset', json, ($checkedConvert) {
      final val = _SpeciesCatalogAsset(
        version: $checkedConvert('version', (v) => (v as num).toInt()),
        species: $checkedConvert(
          'species',
          (v) => (v as List<dynamic>)
              .map((e) => SpeciesSeedEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SpeciesCatalogAssetToJson(
  _SpeciesCatalogAsset instance,
) => <String, dynamic>{
  'version': instance.version,
  'species': instance.species.map((e) => e.toJson()).toList(),
};

_SpeciesSeedEntry _$SpeciesSeedEntryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_SpeciesSeedEntry',
      json,
      ($checkedConvert) {
        final val = _SpeciesSeedEntry(
          id: $checkedConvert('id', (v) => v as String),
          commonNameEn: $checkedConvert('common_name_en', (v) => v as String),
          commonNameEs: $checkedConvert('common_name_es', (v) => v as String),
          scientificName: $checkedConvert(
            'scientific_name',
            (v) => v as String,
          ),
          descriptionEn: $checkedConvert('description_en', (v) => v as String),
          descriptionEs: $checkedConvert('description_es', (v) => v as String),
          wateringFrequencyDays: $checkedConvert(
            'watering_frequency_days',
            (v) => (v as num).toInt(),
          ),
          fertilizingFrequencyDays: $checkedConvert(
            'fertilizing_frequency_days',
            (v) => (v as num).toInt(),
          ),
          lightRequirement: $checkedConvert(
            'light_requirement',
            (v) => v as String,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'commonNameEn': 'common_name_en',
        'commonNameEs': 'common_name_es',
        'scientificName': 'scientific_name',
        'descriptionEn': 'description_en',
        'descriptionEs': 'description_es',
        'wateringFrequencyDays': 'watering_frequency_days',
        'fertilizingFrequencyDays': 'fertilizing_frequency_days',
        'lightRequirement': 'light_requirement',
      },
    );

Map<String, dynamic> _$SpeciesSeedEntryToJson(_SpeciesSeedEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'common_name_en': instance.commonNameEn,
      'common_name_es': instance.commonNameEs,
      'scientific_name': instance.scientificName,
      'description_en': instance.descriptionEn,
      'description_es': instance.descriptionEs,
      'watering_frequency_days': instance.wateringFrequencyDays,
      'fertilizing_frequency_days': instance.fertilizingFrequencyDays,
      'light_requirement': instance.lightRequirement,
    };
