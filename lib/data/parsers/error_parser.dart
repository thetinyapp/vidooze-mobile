import 'package:dio/dio.dart';
import 'package:vidooze_mobile/data/dto/exception/login_exception.dart';
import 'package:vidooze_mobile/data/dto/exception/signup_exception.dart';

LoginException parseLoginException(DioException e) {
  const defaultMessage = "Failed to login";

  if (e.response != null && e.response?.data is Map<String, dynamic>) {
    final message =
        (e.response?.data as Map<String, dynamic>)["message"] ?? defaultMessage;
    return LoginException(message, e, StackTrace.empty);
  }

  return LoginException(defaultMessage, e, StackTrace.empty);
}

SignupException parseSignupException(DioException e) {
  const defaultMessage = "Failed to signup";

  if (e.response != null && e.response?.data is Map<String, dynamic>) {
    final message =
        (e.response?.data as Map<String, dynamic>)["message"] ?? defaultMessage;
    return SignupException(message, e, StackTrace.empty);
  }

  return SignupException(defaultMessage, e, StackTrace.empty);
}
