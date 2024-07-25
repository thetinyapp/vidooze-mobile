import 'package:result_dart/src/result.dart';
import 'package:vidooze_mobile/data/data_sources/auth_data_source.dart';
import 'package:vidooze_mobile/data/data_sources/token_data_source.dart';
import 'package:vidooze_mobile/data/repository/base_repository.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';
import 'package:vidooze_mobile/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final AuthDataSource _authDataSource;
  final TokenDataSource _tokenDataSource;

  AuthRepositoryImpl({
    required AuthDataSource authDataSource,
    required TokenDataSource tokenDataSource,
    required super.errorReportingDataSource,
  })  : _authDataSource = authDataSource,
        _tokenDataSource = tokenDataSource;

  @override
  Future<Result<bool, BaseError>> login() async {
    return await parseOrError(() async {
      final result = await _authDataSource.login();
      _saveToken(
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
      );
      return true;
    });
  }

  void _saveToken({required String accessToken, required String refreshToken}) {
    _tokenDataSource.setAccessToken(accessToken);
    _tokenDataSource.setRefreshToken(refreshToken);
  }
}
