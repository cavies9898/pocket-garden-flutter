import 'dart:async';

import 'package:pocket_garden/core/database/app_database.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/core/files/local_photo_storage.dart';
import 'package:pocket_garden/core/files/photo_storage.dart';
import 'package:pocket_garden/features/species_catalog/presentation/providers/species_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'database_providers.g.dart';

/// Overridden in `main` after `SharedPreferences.getInstance()` and in tests.
/// Keeping it synchronous means the first frame can use the persisted theme.
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw StateError('sharedPreferencesProvider must be overridden at startup');
}

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase.defaults();
  ref.onDispose(() => unawaited(database.close()));
  return database;
}

@Riverpod(keepAlive: true)
PhotoStorage photoStorage(Ref ref) => LocalPhotoStorage();

@riverpod
Future<Result<String?>> resolvedPhotoPath(Ref ref, String relativePath) =>
    ref.watch(photoStorageProvider).resolveAbsolutePath(relativePath);

/// Runs once before the router is shown. A failed seed is returned as data so
/// the startup screen can offer a retry without an untyped exception reaching
/// the UI.
@Riverpod(keepAlive: true)
Future<Result<void>> appBootstrap(Ref ref) =>
    ref.watch(speciesCatalogSeederProvider)();
