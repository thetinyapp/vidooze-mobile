import 'package:dio/dio.dart';
import 'package:vidooze_mobile/data/dto/exception/base_exception.dart';
import 'package:vidooze_mobile/data/dto/exception/connection_exception.dart';
import 'package:vidooze_mobile/data/dto/exception/unknown_exception.dart';

class BaseRemoteDataSource {
  parseError<T extends BaseException>(Object error, StackTrace stackTrace,
      T Function(DioException exception) fn) {
    if (error is! DioException) {
      return UnknownException("Unknown error", error, stackTrace);
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.cancel:
        return ConnectionException(error, stackTrace);
      case DioExceptionType.badResponse:
        return fn(error);
      case DioExceptionType.unknown:
        return UnknownException("Unknown error", error, stackTrace);
    }
  }
}
