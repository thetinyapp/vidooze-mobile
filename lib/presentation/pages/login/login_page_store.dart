import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/domain/entity/analytics/login_failure_analytics_event/login_failure_analytics_event.dart';
import 'package:vidooze_mobile/domain/entity/analytics/login_success_analytics_event/login_success_analytics_event.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/domain/repository/auth_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_page_store.dart';
import 'package:vidooze_mobile/presentation/pages/login/events/login_event.dart';

// Include generated file
part 'login_page_store.g.dart';

class LoginPageStore extends _LoginPageStore with _$LoginPageStore {
  LoginPageStore({
    required super.authRepository,
    required super.analyticsRepository,
  });
}

abstract class _LoginPageStore extends BasePageStore with Store {
  final AuthRepository _authRepository;
  final AnalyticsRepository _analyticsRepository;

  @observable
  LoginEvent event = LoginEvent.idle();

  _LoginPageStore({
    required AuthRepository authRepository,
    required AnalyticsRepository analyticsRepository,
  })  : _authRepository = authRepository,
        _analyticsRepository = analyticsRepository;

  _handleLoginSuccess(_) async {
    await _analyticsRepository
        .logEvent(LoginSuccessAnalyticsEvent(type: "form"));
    event = LoginEvent.success();
  }

  _handleLoginFailure(BaseError value) async {
    await _analyticsRepository
        .logEvent(LoginFailureAnalyticsEvent(type: "form"));
    event = LoginEvent.error(value.message);
  }

  login({required String email, required String password}) async {
    event = LoginEvent.authorisationInProgress();
    final result = await executeCall(
        () => _authRepository.login(email: email, password: password));
    result
      ..onSuccess(_handleLoginSuccess)
      ..onFailure(_handleLoginFailure);
  }
}
