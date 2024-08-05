import 'package:result_dart/result_dart.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';

abstract class AuthRepository<E extends BaseError> {
  Future<Result<bool, E>> login({
    required String email,
    required String password,
  });

  Future<Result<bool, E>> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
}
