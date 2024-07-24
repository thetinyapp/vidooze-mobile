import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';

abstract class AuthRepository {
  Future<Result<bool, BaseError>> login();
}
