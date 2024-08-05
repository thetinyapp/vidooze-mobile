import 'package:vidooze_mobile/data/dto/exception/base_exception.dart';

class SignupException extends BaseException {
  SignupException(super.message, super.error, super.stackTrace);

  @override
  String toString() => message;
}
