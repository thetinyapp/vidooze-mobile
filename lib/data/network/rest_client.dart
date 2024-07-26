import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vidooze_mobile/data/dto/response/login_response/login_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(
    Dio dio, {
    String baseUrl,
  }) = _RestClient;

  @GET('/b18df0d96a17c30c8f08')
  Future<LoginResponse> login();
}

Dio buildClient({required String baseUrl}) {
  return Dio()
    ..options = BaseOptions(baseUrl: baseUrl)
    ..interceptors.addAll([
      PrettyDioLogger(),
    ]);
}
