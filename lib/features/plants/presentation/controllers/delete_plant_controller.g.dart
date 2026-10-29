// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_plant_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeletePlantController)
final deletePlantControllerProvider = DeletePlantControllerProvider._();

final class DeletePlantControllerProvider
    extends $AsyncNotifierProvider<DeletePlantController, void> {
  DeletePlantControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deletePlantControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deletePlantControllerHash();

  @$internal
  @override
  DeletePlantController create() => DeletePlantController();
}

String _$deletePlantControllerHash() =>
    r'89714b44657885488d63a68c7d7d25c00aa9e3d2';

abstract class _$DeletePlantController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
