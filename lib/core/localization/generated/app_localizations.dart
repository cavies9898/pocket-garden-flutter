import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Pocket Garden'**
  String get appTitle;

  /// No description provided for @plantsTab.
  ///
  /// In en, this message translates to:
  /// **'Plants'**
  String get plantsTab;

  /// No description provided for @settingsTab.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTab;

  /// No description provided for @plantsTitle.
  ///
  /// In en, this message translates to:
  /// **'My plants'**
  String get plantsTitle;

  /// No description provided for @addPlant.
  ///
  /// In en, this message translates to:
  /// **'Add plant'**
  String get addPlant;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorDatabase.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t access your local garden data.'**
  String get errorDatabase;

  /// No description provided for @errorStorage.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t access a file on this device.'**
  String get errorStorage;

  /// No description provided for @errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get errorUnexpected;

  /// No description provided for @errorCatalog.
  ///
  /// In en, this message translates to:
  /// **'The plant catalog couldn\'t be loaded.'**
  String get errorCatalog;

  /// No description provided for @errorSettings.
  ///
  /// In en, this message translates to:
  /// **'Your preferences couldn\'t be saved.'**
  String get errorSettings;

  /// No description provided for @loadingPlants.
  ///
  /// In en, this message translates to:
  /// **'Loading your plants'**
  String get loadingPlants;

  /// No description provided for @emptyPlantsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your garden is waiting'**
  String get emptyPlantsTitle;

  /// No description provided for @emptyPlantsBody.
  ///
  /// In en, this message translates to:
  /// **'Add your first plant and keep its care routine close.'**
  String get emptyPlantsBody;

  /// No description provided for @addFirstPlant.
  ///
  /// In en, this message translates to:
  /// **'Add my first plant'**
  String get addFirstPlant;

  /// No description provided for @plantLocationIndoor.
  ///
  /// In en, this message translates to:
  /// **'Indoor'**
  String get plantLocationIndoor;

  /// No description provided for @plantLocationOutdoor.
  ///
  /// In en, this message translates to:
  /// **'Outdoor'**
  String get plantLocationOutdoor;

  /// No description provided for @careGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Care guide'**
  String get careGuideTitle;

  /// No description provided for @careWateringTitle.
  ///
  /// In en, this message translates to:
  /// **'Watering'**
  String get careWateringTitle;

  /// No description provided for @careFertilizingTitle.
  ///
  /// In en, this message translates to:
  /// **'Fertilizing'**
  String get careFertilizingTitle;

  /// No description provided for @careLightTitle.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get careLightTitle;

  /// No description provided for @careEveryDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Every day} other{Every {count} days}}'**
  String careEveryDays(int count);

  /// No description provided for @lightLow.
  ///
  /// In en, this message translates to:
  /// **'Low light'**
  String get lightLow;

  /// No description provided for @lightMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium light'**
  String get lightMedium;

  /// No description provided for @lightBrightIndirect.
  ///
  /// In en, this message translates to:
  /// **'Bright, indirect light'**
  String get lightBrightIndirect;

  /// No description provided for @lightFullSun.
  ///
  /// In en, this message translates to:
  /// **'Full sun'**
  String get lightFullSun;

  /// No description provided for @plantNotesTitle.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get plantNotesTitle;

  /// No description provided for @plantAddedOn.
  ///
  /// In en, this message translates to:
  /// **'Added {date}'**
  String plantAddedOn(String date);

  /// No description provided for @plantUpdatedOn.
  ///
  /// In en, this message translates to:
  /// **'Updated {date}'**
  String plantUpdatedOn(String date);

  /// No description provided for @editPlant.
  ///
  /// In en, this message translates to:
  /// **'Edit plant'**
  String get editPlant;

  /// No description provided for @deletePlant.
  ///
  /// In en, this message translates to:
  /// **'Delete plant'**
  String get deletePlant;

  /// No description provided for @deletePlantTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete {nickname}?'**
  String deletePlantTitle(String nickname);

  /// No description provided for @deletePlantBody.
  ///
  /// In en, this message translates to:
  /// **'This removes the plant, its notes and its photo from this device. This can\'t be undone.'**
  String get deletePlantBody;

  /// No description provided for @plantDeleted.
  ///
  /// In en, this message translates to:
  /// **'{nickname} was deleted.'**
  String plantDeleted(String nickname);

  /// No description provided for @newPlantTitle.
  ///
  /// In en, this message translates to:
  /// **'New plant'**
  String get newPlantTitle;

  /// No description provided for @editPlantTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit {nickname}'**
  String editPlantTitle(String nickname);

  /// No description provided for @nicknameLabel.
  ///
  /// In en, this message translates to:
  /// **'Nickname'**
  String get nicknameLabel;

  /// No description provided for @nicknameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Monstera by the sofa'**
  String get nicknameHint;

  /// No description provided for @speciesLabel.
  ///
  /// In en, this message translates to:
  /// **'Species'**
  String get speciesLabel;

  /// No description provided for @speciesHint.
  ///
  /// In en, this message translates to:
  /// **'Choose a species'**
  String get speciesHint;

  /// No description provided for @locationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationLabel;

  /// No description provided for @notesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get notesLabel;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'Light, pot size, anything you want to remember…'**
  String get notesHint;

  /// No description provided for @photoSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get photoSectionTitle;

  /// No description provided for @addPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add photo'**
  String get addPhoto;

  /// No description provided for @changePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get changePhoto;

  /// No description provided for @removePhoto.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get removePhoto;

  /// No description provided for @choosePhotoSourceTitle.
  ///
  /// In en, this message translates to:
  /// **'Add a plant photo'**
  String get choosePhotoSourceTitle;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get takePhoto;

  /// No description provided for @chooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get chooseFromGallery;

  /// No description provided for @cameraPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera access'**
  String get cameraPermissionTitle;

  /// No description provided for @cameraPermissionBody.
  ///
  /// In en, this message translates to:
  /// **'Pocket Garden uses the camera only to take a photo of your plant. Photos stay on this device.'**
  String get cameraPermissionBody;

  /// No description provided for @cameraPermissionAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get cameraPermissionAction;

  /// No description provided for @permissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Camera access was denied. You can enable it in system settings or choose a photo from the gallery.'**
  String get permissionDenied;

  /// No description provided for @photoPickerError.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t open that photo. Please try another one.'**
  String get photoPickerError;

  /// No description provided for @validationNicknameRequired.
  ///
  /// In en, this message translates to:
  /// **'Give your plant a nickname.'**
  String get validationNicknameRequired;

  /// No description provided for @validationNicknameTooLong.
  ///
  /// In en, this message translates to:
  /// **'Keep the nickname under 60 characters.'**
  String get validationNicknameTooLong;

  /// No description provided for @validationSpeciesRequired.
  ///
  /// In en, this message translates to:
  /// **'Choose a species.'**
  String get validationSpeciesRequired;

  /// No description provided for @validationNotesTooLong.
  ///
  /// In en, this message translates to:
  /// **'Keep notes under 500 characters.'**
  String get validationNotesTooLong;

  /// No description provided for @validationUnknown.
  ///
  /// In en, this message translates to:
  /// **'Please check this field.'**
  String get validationUnknown;

  /// No description provided for @savePlant.
  ///
  /// In en, this message translates to:
  /// **'Save plant'**
  String get savePlant;

  /// No description provided for @loadingForm.
  ///
  /// In en, this message translates to:
  /// **'Loading plant form'**
  String get loadingForm;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get saving;

  /// No description provided for @plantNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Plant not found'**
  String get plantNotFoundTitle;

  /// No description provided for @plantNotFoundBody.
  ///
  /// In en, this message translates to:
  /// **'It may have been deleted from this device.'**
  String get plantNotFoundBody;

  /// No description provided for @backToPlants.
  ///
  /// In en, this message translates to:
  /// **'Back to my plants'**
  String get backToPlants;

  /// No description provided for @appearanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearanceTitle;

  /// No description provided for @appearanceSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get appearanceSystem;

  /// No description provided for @appearanceLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get appearanceLight;

  /// No description provided for @appearanceDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get appearanceDark;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System language'**
  String get languageSystem;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get languageSpanish;

  /// No description provided for @localOnlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Private by design'**
  String get localOnlyTitle;

  /// No description provided for @localOnlyBody.
  ///
  /// In en, this message translates to:
  /// **'Your plants, photos and notes stay on this device. Pocket Garden never connects to the internet.'**
  String get localOnlyBody;

  /// No description provided for @settingsLoading.
  ///
  /// In en, this message translates to:
  /// **'Saving preference…'**
  String get settingsLoading;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsUpdateError.
  ///
  /// In en, this message translates to:
  /// **'Your preference couldn\'t be saved.'**
  String get settingsUpdateError;

  /// No description provided for @startupLoading.
  ///
  /// In en, this message translates to:
  /// **'Preparing your garden…'**
  String get startupLoading;

  /// No description provided for @startupErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'The garden couldn\'t open'**
  String get startupErrorTitle;

  /// No description provided for @startupErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Your local data is safe. Try opening the app again.'**
  String get startupErrorBody;

  /// No description provided for @startupRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get startupRetry;

  /// No description provided for @plantPhotoSemantics.
  ///
  /// In en, this message translates to:
  /// **'Photo of {nickname}'**
  String plantPhotoSemantics(String nickname);

  /// No description provided for @openPlantSemantics.
  ///
  /// In en, this message translates to:
  /// **'Open {nickname}, {species}, {location}'**
  String openPlantSemantics(String nickname, String species, String location);

  /// No description provided for @optionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optionalLabel;

  /// No description provided for @notesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No notes yet.'**
  String get notesEmpty;

  /// No description provided for @careInfoSemantics.
  ///
  /// In en, this message translates to:
  /// **'{title}: {value}'**
  String careInfoSemantics(String title, String value);

  /// No description provided for @plantDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Plant details'**
  String get plantDetailsTitle;

  /// No description provided for @formLoadError.
  ///
  /// In en, this message translates to:
  /// **'The form couldn\'t load this plant.'**
  String get formLoadError;

  /// No description provided for @formLoadRetry.
  ///
  /// In en, this message translates to:
  /// **'Reload form'**
  String get formLoadRetry;

  /// No description provided for @photoPreviewSemantics.
  ///
  /// In en, this message translates to:
  /// **'Selected plant photo'**
  String get photoPreviewSemantics;

  /// No description provided for @settingsSemantics.
  ///
  /// In en, this message translates to:
  /// **'Pocket Garden settings'**
  String get settingsSemantics;

  /// No description provided for @themeModeSemantics.
  ///
  /// In en, this message translates to:
  /// **'Theme: {mode}'**
  String themeModeSemantics(String mode);

  /// No description provided for @routeNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'This path does not exist'**
  String get routeNotFoundTitle;

  /// No description provided for @routeNotFoundBody.
  ///
  /// In en, this message translates to:
  /// **'Let us take you back to your garden.'**
  String get routeNotFoundBody;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
