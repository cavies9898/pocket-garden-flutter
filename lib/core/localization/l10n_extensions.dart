import 'package:flutter/widgets.dart';
import 'package:pocket_garden/core/localization/generated/app_localizations.dart';

extension AppLocalizationsContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
