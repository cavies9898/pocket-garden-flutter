import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant_draft.dart';
import 'package:pocket_garden/features/plants/domain/repositories/plant_repository.dart';
import 'package:pocket_garden/features/plants/domain/usecases/create_plant.dart';
import 'package:pocket_garden/features/plants/domain/usecases/plant_draft_validator.dart';

import '../../../helpers/fixtures.dart';

class _MockPlantRepository extends Mock implements PlantRepository {}

void main() {
  late _MockPlantRepository repository;
  late CreatePlant createPlant;

  setUp(() {
    repository = _MockPlantRepository();
    createPlant = CreatePlant(repository, const PlantDraftValidator());
  });

  group('CreatePlant', () {
    test('validates and delegates the normalized draft', () async {
      const rawDraft = PlantDraft(
        nickname: '  Monstera  ',
        speciesId: ' monstera-deliciosa ',
        location: PlantLocation.indoor,
        notes: '  Near the window  ',
      );
      final expectedDraft = rawDraft.copyWith(
        nickname: 'Monstera',
        speciesId: 'monstera-deliciosa',
        notes: 'Near the window',
      );
      final plant = buildPlant(notes: 'Near the window');

      when(
        () => repository.create(expectedDraft),
      ).thenAnswer((_) async => Success(plant));

      final result = await createPlant(rawDraft);

      expect(result.valueOrNull, plant);
      verify(() => repository.create(expectedDraft)).called(1);
    });

    test('forwards the photo source path untouched', () async {
      final plant = buildPlant(photoPath: 'plant_photos/one.jpg');

      when(
        () => repository.create(
          defaultDraft,
          photoSourcePath: '/tmp/picked.jpg',
        ),
      ).thenAnswer((_) async => Success(plant));

      final result = await createPlant(
        defaultDraft,
        photoSourcePath: '/tmp/picked.jpg',
      );

      expect(result.valueOrNull, plant);
      verify(
        () => repository.create(
          defaultDraft,
          photoSourcePath: '/tmp/picked.jpg',
        ),
      ).called(1);
    });

    test('never touches the repository when validation fails', () async {
      final result = await createPlant(defaultDraft.copyWith(nickname: '  '));

      expect(result, isA<FailureResult<Plant>>());
      final failure = result.failureOrNull;
      expect(failure, isA<ValidationFailure>());
      expect(
        (failure! as ValidationFailure).field,
        ValidationField.nickname,
      );
      verifyZeroInteractions(repository);
    });

    test('propagates repository failures unchanged', () async {
      const failure = StorageFailure(
        cause: 'disk full',
        stackTrace: StackTrace.empty,
      );
      when(
        () => repository.create(defaultDraft, photoSourcePath: '/tmp/a.jpg'),
      ).thenAnswer((_) async => const FailureResult(failure));

      final result = await createPlant(
        defaultDraft,
        photoSourcePath: '/tmp/a.jpg',
      );

      expect(result.failureOrNull, same(failure));
    });
  });
}
