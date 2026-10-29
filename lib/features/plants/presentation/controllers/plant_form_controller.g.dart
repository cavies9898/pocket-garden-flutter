// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlantFormController)
final plantFormControllerProvider = PlantFormControllerFamily._();

final class PlantFormControllerProvider
    extends $AsyncNotifierProvider<PlantFormController, PlantFormState> {
  PlantFormControllerProvider._({
    required PlantFormControllerFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'plantFormControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$plantFormControllerHash();

  @override
  String toString() {
    return r'plantFormControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PlantFormController create() => PlantFormController();

  @override
  bool operator ==(Object other) {
    return other is PlantFormControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$plantFormControllerHash() =>
    r'185ec560147bc18fbbe2b4c8743632f44967d4e2';

final class PlantFormControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          PlantFormController,
          AsyncValue<PlantFormState>,
          PlantFormState,
          FutureOr<PlantFormState>,
          String?
        > {
  PlantFormControllerFamily._()
    : super(
        retry: null,
        name: r'plantFormControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlantFormControllerProvider call(String? plantId) =>
      PlantFormControllerProvider._(argument: plantId, from: this);

  @override
  String toString() => r'plantFormControllerProvider';
}

abstract class _$PlantFormController extends $AsyncNotifier<PlantFormState> {
  late final _$args = ref.$arg as String?;
  String? get plantId => _$args;

  FutureOr<PlantFormState> build(String? plantId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PlantFormState>, PlantFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PlantFormState>, PlantFormState>,
              AsyncValue<PlantFormState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
