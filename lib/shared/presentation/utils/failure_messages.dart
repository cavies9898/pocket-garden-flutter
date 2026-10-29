import 'package:pocket_garden/core/errors/failure.dart';
import 'package:pocket_garden/core/localization/generated/app_localizations.dart';

String validationMessage(AppLocalizations l10n, ValidationFailure failure) {
  return switch (failure.field) {
    ValidationField.nickname => switch (failure.problem) {
      ValidationProblem.required => l10n.validationNicknameRequired,
      ValidationProblem.tooLong => l10n.validationNicknameTooLong,
      ValidationProblem.unknown => l10n.validationUnknown,
    },
    ValidationField.speciesId => l10n.validationSpeciesRequired,
    ValidationField.notes => switch (failure.problem) {
      ValidationProblem.tooLong => l10n.validationNotesTooLong,
      ValidationProblem.required ||
      ValidationProblem.unknown => l10n.validationUnknown,
    },
  };
}

String failureMessage(AppLocalizations l10n, Failure failure) {
  return switch (failure) {
    ValidationFailure() => validationMessage(l10n, failure),
    NotFoundFailure() => l10n.plantNotFoundBody,
    DatabaseFailure() => l10n.errorDatabase,
    StorageFailure() => l10n.errorStorage,
    DataFailure() => l10n.errorCatalog,
    PermissionFailure() => l10n.permissionDenied,
    PhotoPickerFailure() => l10n.photoPickerError,
    UnexpectedFailure() => l10n.errorUnexpected,
  };
}
