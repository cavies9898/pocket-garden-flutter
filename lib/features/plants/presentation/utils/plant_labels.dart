import 'package:pocket_garden/core/localization/generated/app_localizations.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/species_catalog/domain/entities/species.dart';

extension PlantLocationL10n on PlantLocation {
  String label(AppLocalizations l10n) => switch (this) {
    PlantLocation.indoor => l10n.plantLocationIndoor,
    PlantLocation.outdoor => l10n.plantLocationOutdoor,
  };
}

extension LightRequirementL10n on LightRequirement {
  String label(AppLocalizations l10n) => switch (this) {
    LightRequirement.low => l10n.lightLow,
    LightRequirement.medium => l10n.lightMedium,
    LightRequirement.brightIndirect => l10n.lightBrightIndirect,
    LightRequirement.fullSun => l10n.lightFullSun,
  };
}

extension SpeciesL10n on Species {
  String localizedCommonName(AppLocalizations l10n) =>
      commonName(l10n.localeName);

  String localizedDescription(AppLocalizations l10n) =>
      description(l10n.localeName);
}
