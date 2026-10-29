/// Domain-level failures.
///
/// Failures deliberately carry no user-facing copy. Presentation maps them to
/// localized messages, so the domain remains free of Flutter and translations.
sealed class Failure {
  const Failure();
}

enum ValidationField { nickname, speciesId, notes }

enum ValidationProblem { required, tooLong, unknown }

final class ValidationFailure extends Failure {
  const ValidationFailure({required this.field, required this.problem});

  final ValidationField field;
  final ValidationProblem problem;
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure({required this.entity});

  final String entity;
}

final class DatabaseFailure extends Failure {
  const DatabaseFailure({required this.cause, required this.stackTrace});

  final Object cause;
  final StackTrace stackTrace;
}

final class StorageFailure extends Failure {
  const StorageFailure({required this.cause, required this.stackTrace});

  final Object cause;
  final StackTrace stackTrace;
}

final class DataFailure extends Failure {
  const DataFailure({required this.resource, required this.cause});

  final String resource;
  final Object cause;
}

enum PermissionKind { camera, photos }

final class PermissionFailure extends Failure {
  const PermissionFailure(this.kind);

  final PermissionKind kind;
}

final class PhotoPickerFailure extends Failure {
  const PhotoPickerFailure({required this.cause, required this.stackTrace});

  final Object cause;
  final StackTrace stackTrace;
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required this.cause, required this.stackTrace});

  final Object cause;
  final StackTrace stackTrace;
}
