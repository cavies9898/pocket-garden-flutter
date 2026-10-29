import 'package:pocket_garden/core/constants/app_constants.dart';
import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/errors/result.dart';
import 'package:pocket_garden/features/plants/domain/entities/plant_draft.dart';

/// Normalizes and validates user input once, before it reaches a repository.
final class PlantDraftValidator {
  const PlantDraftValidator();

  Result<PlantDraft> call(PlantDraft draft) {
    final nickname = draft.nickname.trim();
    if (nickname.isEmpty) {
      return const FailureResult(
        ValidationFailure(
          field: ValidationField.nickname,
          problem: ValidationProblem.required,
        ),
      );
    }
    if (nickname.runes.length > AppConstants.maxNicknameLength) {
      return const FailureResult(
        ValidationFailure(
          field: ValidationField.nickname,
          problem: ValidationProblem.tooLong,
        ),
      );
    }

    final speciesId = draft.speciesId.trim();
    if (speciesId.isEmpty) {
      return const FailureResult(
        ValidationFailure(
          field: ValidationField.speciesId,
          problem: ValidationProblem.required,
        ),
      );
    }

    final trimmedNotes = draft.notes?.trim();
    final notes = trimmedNotes == null || trimmedNotes.isEmpty
        ? null
        : trimmedNotes;
    if (notes != null && notes.runes.length > AppConstants.maxNotesLength) {
      return const FailureResult(
        ValidationFailure(
          field: ValidationField.notes,
          problem: ValidationProblem.tooLong,
        ),
      );
    }

    return Success(
      draft.copyWith(nickname: nickname, speciesId: speciesId, notes: notes),
    );
  }
}
