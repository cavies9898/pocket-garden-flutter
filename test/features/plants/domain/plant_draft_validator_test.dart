import 'package:flutter_test/flutter_test.dart';
import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant_draft.dart';
import 'package:pocket_garden/features/plants/domain/usecases/plant_draft_validator.dart';

void main() {
  const validator = PlantDraftValidator();

  PlantDraft draft({
    String nickname = 'Monstera',
    String speciesId = 'monstera-deliciosa',
    String? notes,
  }) {
    return PlantDraft(
      nickname: nickname,
      speciesId: speciesId,
      location: PlantLocation.indoor,
      notes: notes,
    );
  }

  ValidationFailure validationFailureOf(Result<PlantDraft> result) {
    return result.failureOrNull! as ValidationFailure;
  }

  group('PlantDraftValidator', () {
    test('trims the nickname and species id', () {
      final result = validator(
        draft(nickname: '  Monstera  ', speciesId: '  monstera-deliciosa  '),
      );

      expect(result, isA<Success<PlantDraft>>());
      final value = result.valueOrNull!;
      expect(value.nickname, 'Monstera');
      expect(value.speciesId, 'monstera-deliciosa');
      expect(value.notes, isNull);
    });

    test('rejects an empty nickname', () {
      final failure = validationFailureOf(validator(draft(nickname: '   ')));

      expect(failure.field, ValidationField.nickname);
      expect(failure.problem, ValidationProblem.required);
    });

    test('rejects a nickname longer than the configured limit', () {
      final failure = validationFailureOf(
        validator(
          draft(nickname: 'a' * (AppConstants.maxNicknameLength + 1)),
        ),
      );

      expect(failure.field, ValidationField.nickname);
      expect(failure.problem, ValidationProblem.tooLong);
    });

    test('accepts a nickname exactly at the limit', () {
      final result = validator(
        draft(nickname: 'a' * AppConstants.maxNicknameLength),
      );

      expect(result.isSuccess, isTrue);
    });

    test('counts unicode code points instead of UTF-16 code units', () {
      // Each emoji uses two UTF-16 code units but one rune.
      final emojiNickname = '🌿' * AppConstants.maxNicknameLength;

      expect(validator(draft(nickname: emojiNickname)).isSuccess, isTrue);
    });

    test('rejects an empty species id', () {
      final failure = validationFailureOf(validator(draft(speciesId: ' ')));

      expect(failure.field, ValidationField.speciesId);
      expect(failure.problem, ValidationProblem.required);
    });

    test('normalizes blank notes to null', () {
      final result = validator(draft(notes: '   '));

      expect(result.valueOrNull!.notes, isNull);
    });

    test('trims notes', () {
      final result = validator(draft(notes: '  Water on Sundays  '));

      expect(result.valueOrNull!.notes, 'Water on Sundays');
    });

    test('rejects notes longer than the configured limit', () {
      final failure = validationFailureOf(
        validator(draft(notes: 'a' * (AppConstants.maxNotesLength + 1))),
      );

      expect(failure.field, ValidationField.notes);
      expect(failure.problem, ValidationProblem.tooLong);
    });

    test('preserves location while normalizing text', () {
      final result = validator(
        draft(nickname: ' Fern ', notes: ' Shade ').copyWith(
          location: PlantLocation.outdoor,
        ),
      );

      final value = result.valueOrNull!;
      expect(value.nickname, 'Fern');
      expect(value.location, PlantLocation.outdoor);
      expect(value.notes, 'Shade');
    });
  });
}
