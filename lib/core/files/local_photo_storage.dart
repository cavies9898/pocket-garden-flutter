import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/core/files/photo_storage.dart';
import 'package:uuid/uuid.dart';

/// File-based implementation. Photos are compressed by the native plugin and
/// stored below the app documents directory, never in the database.
final class LocalPhotoStorage implements PhotoStorage {
  LocalPhotoStorage({
    Future<Directory> Function()? documentsDirectoryProvider,
    Uuid? uuid,
  }) : _documentsDirectoryProvider =
           documentsDirectoryProvider ?? getApplicationDocumentsDirectory,
       _uuid = uuid ?? const Uuid();

  final Future<Directory> Function() _documentsDirectoryProvider;
  final Uuid _uuid;

  @override
  Future<Result<String>> savePhoto({required String sourcePath}) async {
    try {
      final source = File(sourcePath);
      if (!await source.exists()) {
        return FailureResult(
          StorageFailure(
            cause: FileSystemException(
              'Source photo does not exist',
              sourcePath,
            ),
            stackTrace: StackTrace.current,
          ),
        );
      }

      final directory = await _photosDirectory();
      final filename = '${_uuid.v4()}.jpg';
      final targetPath = p.join(directory.path, filename);
      final compressed = await FlutterImageCompress.compressAndGetFile(
        source.path,
        targetPath,
        quality: AppConstants.photoQuality,
        minWidth: AppConstants.maxPhotoWidth,
        minHeight: AppConstants.maxPhotoHeight,
      );

      if (compressed == null) {
        await _deleteIfPresent(targetPath);
        return FailureResult(
          StorageFailure(
            cause: const FormatException('The image could not be compressed'),
            stackTrace: StackTrace.current,
          ),
        );
      }

      return Success(p.posix.join(AppConstants.plantPhotosDirectory, filename));
    } on Object catch (error, stackTrace) {
      return FailureResult(
        StorageFailure(cause: error, stackTrace: stackTrace),
      );
    }
  }

  @override
  Future<Result<void>> deletePhoto(String relativePath) async {
    final safePath = _safeRelativePath(relativePath);
    if (safePath == null) {
      return FailureResult(
        StorageFailure(
          cause: FileSystemException(
            'Invalid relative photo path',
            relativePath,
          ),
          stackTrace: StackTrace.current,
        ),
      );
    }

    try {
      final documents = await _documentsDirectoryProvider();
      final file = File(p.joinAll([documents.path, ...safePath.split('/')]));
      if (await file.exists()) {
        await file.delete();
      }
      return const Success(null);
    } on Object catch (error, stackTrace) {
      return FailureResult(
        StorageFailure(cause: error, stackTrace: stackTrace),
      );
    }
  }

  @override
  Future<Result<String?>> resolveAbsolutePath(String relativePath) async {
    final safePath = _safeRelativePath(relativePath);
    if (safePath == null) {
      return FailureResult(
        StorageFailure(
          cause: FileSystemException(
            'Invalid relative photo path',
            relativePath,
          ),
          stackTrace: StackTrace.current,
        ),
      );
    }

    try {
      final documents = await _documentsDirectoryProvider();
      final file = File(p.joinAll([documents.path, ...safePath.split('/')]));
      return Success(await file.exists() ? file.path : null);
    } on Object catch (error, stackTrace) {
      return FailureResult(
        StorageFailure(cause: error, stackTrace: stackTrace),
      );
    }
  }

  Future<Directory> _photosDirectory() async {
    final documents = await _documentsDirectoryProvider();
    final directory = Directory(
      p.join(documents.path, AppConstants.plantPhotosDirectory),
    );
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    return directory;
  }

  /// Prevents a corrupted or malicious relative path from escaping the photos
  /// directory when resolving or deleting a file.
  String? _safeRelativePath(String relativePath) {
    final normalized = p.posix.normalize(relativePath);
    const prefix = '${AppConstants.plantPhotosDirectory}/';
    if (p.posix.isAbsolute(normalized) ||
        normalized == '..' ||
        normalized.startsWith('../') ||
        !normalized.startsWith(prefix) ||
        normalized.length == prefix.length) {
      return null;
    }
    return normalized;
  }

  Future<void> _deleteIfPresent(String absolutePath) async {
    try {
      final file = File(absolutePath);
      if (await file.exists()) {
        await file.delete();
      }
    } on Object catch (error, stackTrace) {
      // Cleanup failure must not hide the original compression failure.
      developer.log(
        'Could not clean up an incomplete photo',
        name: 'LocalPhotoStorage',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
