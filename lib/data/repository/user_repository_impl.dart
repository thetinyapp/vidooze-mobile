import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/data/data_sources/token_data_source.dart';
import 'package:vidooze_mobile/data/repository/base_repository.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';
import 'package:vidooze_mobile/domain/repository/user_repository.dart';

class UserRepositoryImpl extends BaseRepository implements UserRepository {
  final TokenDataSource _tokenDataSource;

  UserRepositoryImpl({
    required super.errorReportingDataSource,
    required TokenDataSource tokenDataSource,
  }) : _tokenDataSource = tokenDataSource;

  @override
  Future<Result<bool, BaseError>> isLoggedIn() async {
    return await parseOrError(() async {
      final it = await _tokenDataSource.getAccessToken();
      return it != null;
    });
  }
}
