// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pocket Garden';

  @override
  String get plantsTab => 'Plants';

  @override
  String get settingsTab => 'Settings';

  @override
  String get plantsTitle => 'My plants';

  @override
  String get addPlant => 'Add plant';

  @override
  String get retry => 'Retry';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get save => 'Save';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get errorDatabase => 'We couldn\'t access your local garden data.';

  @override
  String get errorStorage => 'We couldn\'t access a file on this device.';

  @override
  String get errorUnexpected => 'An unexpected error occurred.';

  @override
  String get errorCatalog => 'The plant catalog couldn\'t be loaded.';

  @override
  String get errorSettings => 'Your preferences couldn\'t be saved.';

  @override
  String get loadingPlants => 'Loading your plants';

  @override
  String get emptyPlantsTitle => 'Your garden is waiting';

  @override
  String get emptyPlantsBody =>
      'Add your first plant and keep its care routine close.';

  @override
  String get addFirstPlant => 'Add my first plant';

  @override
  String get plantLocationIndoor => 'Indoor';

  @override
  String get plantLocationOutdoor => 'Outdoor';

  @override
  String get careGuideTitle => 'Care guide';

  @override
  String get careWateringTitle => 'Watering';

  @override
  String get careFertilizingTitle => 'Fertilizing';

  @override
  String get careLightTitle => 'Light';

  @override
  String careEveryDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Every $count days',
      one: 'Every day',
    );
    return '$_temp0';
  }

  @override
  String get lightLow => 'Low light';

  @override
  String get lightMedium => 'Medium light';

  @override
  String get lightBrightIndirect => 'Bright, indirect light';

  @override
  String get lightFullSun => 'Full sun';

  @override
  String get plantNotesTitle => 'Notes';

  @override
  String plantAddedOn(String date) {
    return 'Added $date';
  }

  @override
  String plantUpdatedOn(String date) {
    return 'Updated $date';
  }

  @override
  String get editPlant => 'Edit plant';

  @override
  String get deletePlant => 'Delete plant';

  @override
  String deletePlantTitle(String nickname) {
    return 'Delete $nickname?';
  }

  @override
  String get deletePlantBody =>
      'This removes the plant, its notes and its photo from this device. This can\'t be undone.';

  @override
  String plantDeleted(String nickname) {
    return '$nickname was deleted.';
  }

  @override
  String get newPlantTitle => 'New plant';

  @override
  String editPlantTitle(String nickname) {
    return 'Edit $nickname';
  }

  @override
  String get nicknameLabel => 'Nickname';

  @override
  String get nicknameHint => 'e.g. Monstera by the sofa';

  @override
  String get speciesLabel => 'Species';

  @override
  String get speciesHint => 'Choose a species';

  @override
  String get locationLabel => 'Location';

  @override
  String get notesLabel => 'Notes (optional)';

  @override
  String get notesHint => 'Light, pot size, anything you want to remember…';

  @override
  String get photoSectionTitle => 'Photo';

  @override
  String get addPhoto => 'Add photo';

  @override
  String get changePhoto => 'Change photo';

  @override
  String get removePhoto => 'Remove photo';

  @override
  String get choosePhotoSourceTitle => 'Add a plant photo';

  @override
  String get takePhoto => 'Take a photo';

  @override
  String get chooseFromGallery => 'Choose from gallery';

  @override
  String get cameraPermissionTitle => 'Camera access';

  @override
  String get cameraPermissionBody =>
      'Pocket Garden uses the camera only to take a photo of your plant. Photos stay on this device.';

  @override
  String get cameraPermissionAction => 'Continue';

  @override
  String get permissionDenied =>
      'Camera access was denied. You can enable it in system settings or choose a photo from the gallery.';

  @override
  String get photoPickerError =>
      'We couldn\'t open that photo. Please try another one.';

  @override
  String get validationNicknameRequired => 'Give your plant a nickname.';

  @override
  String get validationNicknameTooLong =>
      'Keep the nickname under 60 characters.';

  @override
  String get validationSpeciesRequired => 'Choose a species.';

  @override
  String get validationNotesTooLong => 'Keep notes under 500 characters.';

  @override
  String get validationUnknown => 'Please check this field.';

  @override
  String get savePlant => 'Save plant';

  @override
  String get loadingForm => 'Loading plant form';

  @override
  String get saving => 'Saving…';

  @override
  String get plantNotFoundTitle => 'Plant not found';

  @override
  String get plantNotFoundBody => 'It may have been deleted from this device.';

  @override
  String get backToPlants => 'Back to my plants';

  @override
  String get appearanceTitle => 'Appearance';

  @override
  String get appearanceSystem => 'System';

  @override
  String get appearanceLight => 'Light';

  @override
  String get appearanceDark => 'Dark';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageSystem => 'System language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get localOnlyTitle => 'Private by design';

  @override
  String get localOnlyBody =>
      'Your plants, photos and notes stay on this device. Pocket Garden never connects to the internet.';

  @override
  String get settingsLoading => 'Saving preference…';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsUpdateError => 'Your preference couldn\'t be saved.';

  @override
  String get startupLoading => 'Preparing your garden…';

  @override
  String get startupErrorTitle => 'The garden couldn\'t open';

  @override
  String get startupErrorBody =>
      'Your local data is safe. Try opening the app again.';

  @override
  String get startupRetry => 'Try again';

  @override
  String plantPhotoSemantics(String nickname) {
    return 'Photo of $nickname';
  }

  @override
  String openPlantSemantics(String nickname, String species, String location) {
    return 'Open $nickname, $species, $location';
  }

  @override
  String get optionalLabel => 'Optional';

  @override
  String get notesEmpty => 'No notes yet.';

  @override
  String careInfoSemantics(String title, String value) {
    return '$title: $value';
  }

  @override
  String get plantDetailsTitle => 'Plant details';

  @override
  String get formLoadError => 'The form couldn\'t load this plant.';

  @override
  String get formLoadRetry => 'Reload form';

  @override
  String get photoPreviewSemantics => 'Selected plant photo';

  @override
  String get settingsSemantics => 'Pocket Garden settings';

  @override
  String themeModeSemantics(String mode) {
    return 'Theme: $mode';
  }

  @override
  String get routeNotFoundTitle => 'This path does not exist';

  @override
  String get routeNotFoundBody => 'Let us take you back to your garden.';
}
