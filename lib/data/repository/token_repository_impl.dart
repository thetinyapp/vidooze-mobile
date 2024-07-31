import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/data/data_sources/token_data_source.dart';
import 'package:vidooze_mobile/data/repository/base_repository.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';
import 'package:vidooze_mobile/domain/repository/token_repository.dart';

class TokenRepositoryImpl extends BaseRepository implements TokenRepository {
  final TokenDataSource _tokenDataSource;

  TokenRepositoryImpl({
    required TokenDataSource tokenDataSource,
    required super.errorReportingDataSource,
  }) : _tokenDataSource = tokenDataSource;

  @override
  Future<Result<Unit, BaseError>> clear() async {
    return await parseOrError(() async {
      await _tokenDataSource.clear();
      return unit;
    });
  }
}
