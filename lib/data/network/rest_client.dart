import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vidooze_mobile/data/dto/request/login_request/login_request.dart';
import 'package:vidooze_mobile/data/dto/request/signup_request/signup_request.dart';
import 'package:vidooze_mobile/data/dto/response/api_response/api_response.dart';
import 'package:vidooze_mobile/data/dto/response/login_response/login_response.dart';
import 'package:vidooze_mobile/data/dto/response/signup_response/signup_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(
    Dio dio, {
    String baseUrl,
  }) = _RestClient;

  @POST('/user-sessions/authenticate')
  Future<ApiResponse<LoginResponse>> login(@Body() LoginRequest request);

  @POST('/users')
  Future<ApiResponse<SignupResponse>> signup(@Body() SignupRequest request);
}

Dio buildClient({required String baseUrl}) {
  return Dio()
    ..options = BaseOptions(baseUrl: baseUrl)
    ..interceptors.addAll([
      PrettyDioLogger(),
    ]);
}
