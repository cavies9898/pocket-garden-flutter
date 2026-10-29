/// Application-wide constants. Keeping them here avoids magic strings and
/// numbers leaking into features.
abstract final class AppConstants {
  static const appName = 'Pocket Garden';

  static const databaseName = 'pocket_garden';

  static const speciesCatalogAsset = 'assets/data/species_catalog.json';
  static const speciesCatalogSchemaVersion = 1;

  static const plantPhotosDirectory = 'plant_photos';
  static const maxNicknameLength = 60;
  static const maxNotesLength = 500;
  static const maxPhotoWidth = 1440;
  static const maxPhotoHeight = 1440;
  static const photoQuality = 82;

  static const selectedImageCacheSize = 600;
  static const cardImageCacheSize = 480;
  static const detailImageCacheSize = 1200;

  static const wideLayoutBreakpoint = 720.0;
  static const maxReadableContentWidth = 760.0;

  static const defaultAnimationDuration = Duration(milliseconds: 220);
  static const snackBarDuration = Duration(seconds: 3);
}
