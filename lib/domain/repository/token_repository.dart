import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';

abstract class TokenRepository<E extends BaseError> {
  Future<Result<Unit, E>> clear();
}
