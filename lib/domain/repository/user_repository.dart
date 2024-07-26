import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';

abstract class UserRepository {
  Future<Result<bool, BaseError>> isLoggedIn();
}
