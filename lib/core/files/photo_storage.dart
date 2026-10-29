import 'package:pocket_garden/core/errors/result.dart';

/// Stores compressed plant photos as files and exposes only relative paths to
/// the domain. The interface makes photo handling mockable and keeps filesystem
/// details out of widgets and repositories' contracts.
abstract interface class PhotoStorage {
  Future<Result<String>> savePhoto({required String sourcePath});

  Future<Result<void>> deletePhoto(String relativePath);

  Future<Result<String?>> resolveAbsolutePath(String relativePath);
}
