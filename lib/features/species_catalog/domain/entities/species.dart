import 'package:freezed_annotation/freezed_annotation.dart';

part 'species.freezed.dart';

/// Light requirements are domain language, not database or UI language.
enum LightRequirement { low, medium, brightIndirect, fullSun }

@freezed
abstract class Species with _$Species {
  const factory Species({
    required String id,
    required String commonNameEn,
    required String commonNameEs,
    required String scientificName,
    required String descriptionEn,
    required String descriptionEs,
    required int wateringFrequencyDays,
    required int fertilizingFrequencyDays,
    required LightRequirement lightRequirement,
  }) = _Species;

  const Species._();

  String commonName(String languageCode) =>
      languageCode == 'es' ? commonNameEs : commonNameEn;

  String description(String languageCode) =>
      languageCode == 'es' ? descriptionEs : descriptionEn;
}
