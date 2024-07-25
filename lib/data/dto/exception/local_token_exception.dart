import 'package:vidooze_mobile/data/dto/exception/base_exception.dart';

class LocalTokenException extends BaseException {
  LocalTokenException(super.message, super.error, super.stackTrace);

  @override
  String toString() => "LocalTokenException: $message";
}
