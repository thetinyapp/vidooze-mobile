import 'package:vidooze_mobile/data/dto/exception/base_exception.dart';

class UnknownException extends BaseException {
  UnknownException(super.message, super.error, super.stackTrace);

  @override
  String toString() => "UnknownException: $message";
}
