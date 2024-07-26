import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';

abstract class UserRepository<E extends BaseError> {
  Future<Result<bool, E>> isLoggedIn();
}
