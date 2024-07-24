abstract class BaseError implements Exception {
  final String message;

  BaseError(this.message);

  @override
  String toString() => message;
}

class UnAuthorisedError extends BaseError {
  UnAuthorisedError(super.message);
}

class UnknownError extends BaseError {
  UnknownError(super.message);
}
