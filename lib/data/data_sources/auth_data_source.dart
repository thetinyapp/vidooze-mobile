import 'package:dio/dio.dart';
import 'package:vidooze_mobile/data/data_sources/base_remote_data_source.dart';
import 'package:vidooze_mobile/data/dto/exception/login_exception.dart';
import 'package:vidooze_mobile/data/dto/request/login_request.dart';
import 'package:vidooze_mobile/data/dto/response/login_response/login_response.dart';
import 'package:vidooze_mobile/data/network/rest_client.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login({
    required LoginRequest request,
  });
}

class AuthDataSourceImpl extends BaseRemoteDataSource
    implements AuthDataSource {
  final RestClient _restClient;

  AuthDataSourceImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<LoginResponse> login({
    required LoginRequest request,
  }) async {
    try {
      return await _restClient.login(request);
    } catch (e, s) {
      throw parseError<LoginException>(
          e, s, (err) => _parseLoginException(err));
    }
  }

  _parseLoginException(DioException e) {
    const defaultMessage = "Failed to login";

    if (e.response != null && e.response?.data is Map<String, dynamic>) {
      final message = (e.response?.data as Map<String, dynamic>)["message"] ??
          defaultMessage;
      return LoginException(message, e, StackTrace.empty);
    }

    return LoginException(defaultMessage, e, StackTrace.empty);
  }
}
