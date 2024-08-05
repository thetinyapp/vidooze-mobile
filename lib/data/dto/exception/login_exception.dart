import 'package:vidooze_mobile/data/dto/exception/base_exception.dart';

class LoginException extends BaseException {
  LoginException(super.message, super.error, super.stackTrace);

  @override
  String toString() => message;
}
