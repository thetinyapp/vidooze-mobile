import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/domain/repository/auth_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_page_store.dart';

// Include generated file
part 'auth_page_store.g.dart';

class AuthPageStore extends _AuthPageStore with _$AuthPageStore {
  AuthPageStore({required super.authRepository});
}

abstract class _AuthPageStore extends BasePageStore with Store {
  final AuthRepository _authRepository;

  _AuthPageStore({required AuthRepository authRepository})
      : _authRepository = authRepository;

  login() async {
    final result = await executeApiCall(() => _authRepository.login());
    result
      ..onSuccess((value) {})
      ..onFailure((value) {});
  }
}
