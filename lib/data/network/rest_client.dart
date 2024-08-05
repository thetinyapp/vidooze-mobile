import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vidooze_mobile/data/dto/request/login_request.dart';
import 'package:vidooze_mobile/data/dto/response/login_response/login_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(
    Dio dio, {
    String baseUrl,
  }) = _RestClient;

  @POST('/user-sessions/authenticate')
  Future<LoginResponse> login(@Body() LoginRequest request);
}

Dio buildClient({required String baseUrl}) {
  return Dio()
    ..options = BaseOptions(baseUrl: baseUrl)
    ..interceptors.addAll([
      PrettyDioLogger(),
    ]);
}
