import 'package:vidooze_mobile/data/data_sources/base_remote_data_source.dart';
import 'package:vidooze_mobile/data/dto/exception/login_exception.dart';
import 'package:vidooze_mobile/data/dto/exception/signup_exception.dart';
import 'package:vidooze_mobile/data/dto/request/login_request/login_request.dart';
import 'package:vidooze_mobile/data/dto/request/signup_request/signup_request.dart';
import 'package:vidooze_mobile/data/dto/response/api_response/api_response.dart';
import 'package:vidooze_mobile/data/dto/response/login_response/login_response.dart';
import 'package:vidooze_mobile/data/dto/response/signup_response/signup_response.dart';
import 'package:vidooze_mobile/data/network/rest_client.dart';
import 'package:vidooze_mobile/data/parsers/error_parser.dart';

abstract class AuthDataSource {
  Future<ApiResponse<LoginResponse>> login({
    required LoginRequest request,
  });

  Future<ApiResponse<SignupResponse>> signup({
    required SignupRequest request,
  });
}

class AuthDataSourceImpl extends BaseRemoteDataSource
    implements AuthDataSource {
  final RestClient _restClient;

  AuthDataSourceImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<ApiResponse<LoginResponse>> login({
    required LoginRequest request,
  }) async {
    try {
      return await _restClient.login(request);
    } catch (e, s) {
      throw parseError<LoginException>(e, s, parseLoginException);
    }
  }

  @override
  Future<ApiResponse<SignupResponse>> signup(
      {required SignupRequest request}) async {
    try {
      return await _restClient.signup(request);
    } catch (e, s) {
      throw parseError<SignupException>(e, s, parseSignupException);
    }
  }
}
