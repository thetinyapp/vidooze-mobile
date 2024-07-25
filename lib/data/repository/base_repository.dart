import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/data/dto/exception/unauthorized_exception.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';

class BaseRepository {
  Future<Result<T, F>> parseOrError<T extends Object, F extends BaseError>(
    Future<T> Function() parseFunction,
  ) async {
    try {
      final result = await parseFunction();
      return Result.success(result);
    } on UnauthorizedException catch (e) {
      final error = UnauthorisedError(e.toString()) as F;
      return Result.failure(error);
    } catch (e) {
      final error = UnknownError(e.toString()) as F;
      return Result.failure(error);
    }
  }
}
