import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_picker.g.dart';

enum PhotoSource { camera, gallery }

abstract interface class PhotoPicker {
  Future<bool> isCameraPermissionGranted();

  Future<Result<void>> requestCameraPermission();

  Future<Result<String?>> pick(PhotoSource source);
}

final class DevicePhotoPicker implements PhotoPicker {
  DevicePhotoPicker({ImagePicker? picker}) : _picker = picker ?? ImagePicker();

  final ImagePicker _picker;

  @override
  Future<bool> isCameraPermissionGranted() async {
    final status = await Permission.camera.status;
    return status.isGranted;
  }

  @override
  Future<Result<void>> requestCameraPermission() async {
    try {
      final status = await Permission.camera.request();
      return status.isGranted
          ? const Success(null)
          : const FailureResult(PermissionFailure(PermissionKind.camera));
    } on Object catch (error, stackTrace) {
      return FailureResult(
        PhotoPickerFailure(cause: error, stackTrace: stackTrace),
      );
    }
  }

  @override
  Future<Result<String?>> pick(PhotoSource source) async {
    if (source == PhotoSource.camera &&
        defaultTargetPlatform != TargetPlatform.iOS &&
        !await isCameraPermissionGranted()) {
      return const FailureResult(PermissionFailure(PermissionKind.camera));
    }

    try {
      final file = await _picker.pickImage(
        source: source == PhotoSource.camera
            ? ImageSource.camera
            : ImageSource.gallery,
        maxWidth: AppConstants.maxPhotoWidth.toDouble(),
        maxHeight: AppConstants.maxPhotoHeight.toDouble(),
        imageQuality: AppConstants.photoQuality,
        requestFullMetadata: false,
      );
      return Success(file?.path);
    } on PlatformException catch (error, stackTrace) {
      if (source == PhotoSource.camera &&
          (error.code == 'camera_access_denied' ||
              error.code == 'camera_access_restricted')) {
        return const FailureResult(PermissionFailure(PermissionKind.camera));
      }
      return FailureResult(
        PhotoPickerFailure(cause: error, stackTrace: stackTrace),
      );
    } on Object catch (error, stackTrace) {
      return FailureResult(
        PhotoPickerFailure(cause: error, stackTrace: stackTrace),
      );
    }
  }
}

@Riverpod(keepAlive: true)
PhotoPicker photoPicker(Ref ref) => DevicePhotoPicker();
