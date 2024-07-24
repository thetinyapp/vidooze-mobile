import 'package:vidooze_mobile/data/dto/response/login_response/login_response.dart';
import 'package:vidooze_mobile/data/network/rest_client.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login();
}

class AuthDataSourceImpl implements AuthDataSource {
  final RestClient _restClient;

  AuthDataSourceImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<LoginResponse> login() {
    return _restClient.login();
  }
}
