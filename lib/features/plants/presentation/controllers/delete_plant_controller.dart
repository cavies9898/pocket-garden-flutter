import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/plants/presentation/providers/plant_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_plant_controller.g.dart';

@riverpod
class DeletePlantController extends _$DeletePlantController {
  @override
  Future<void> build() async {}

  Future<Result<void>> delete(String id) async {
    if (state.isLoading) {
      return const FailureResult(
        UnexpectedFailure(
          cause: 'A delete operation is already running',
          stackTrace: StackTrace.empty,
        ),
      );
    }

    state = const AsyncLoading();
    final result = await ref.read(deletePlantUseCaseProvider)(id);
    state = switch (result) {
      Success() => const AsyncData(null),
      FailureResult(:final failure) => AsyncError(failure, StackTrace.empty),
    };
    return result;
  }
}
