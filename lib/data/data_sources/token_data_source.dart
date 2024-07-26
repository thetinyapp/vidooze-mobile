import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vidooze_mobile/data/dto/exception/local_token_exception.dart';

abstract class TokenDataSource {
  Future setAccessToken(String value);

  Future<String?> getAccessToken();

  Future setRefreshToken(String value);

  Future<String?> getRefreshTokenToken();
}

class LocalTokenDataSource implements TokenDataSource {
  final FlutterSecureStorage _storage;

  final String _keyAccessToken = "access_token";
  final String _keyRefreshToken = "refresh_token";

  LocalTokenDataSource({required FlutterSecureStorage storage})
      : _storage = storage;

  @override
  Future<String?> getAccessToken() async {
    try {
      final value = await _storage.read(key: _keyAccessToken);
      return value;
    } catch (e, s) {
      throw LocalTokenException("Get access token", e, s);
    }
  }

  @override
  Future<String?> getRefreshTokenToken() async {
    try {
      final value = await _storage.read(key: _keyRefreshToken);
      return value;
    } catch (e, s) {
      throw LocalTokenException("Get refresh token", e, s);
    }
  }

  @override
  Future setAccessToken(String value) async {
    try {
      await _storage.write(key: _keyAccessToken, value: value);
    } catch (e, s) {
      throw LocalTokenException("Setting access token", e, s);
    }
  }

  @override
  Future setRefreshToken(String value) async {
    try {
      await _storage.write(key: _keyRefreshToken, value: value);
    } catch (e, s) {
      throw LocalTokenException("Setting refresh token", e, s);
    }
  }
}
