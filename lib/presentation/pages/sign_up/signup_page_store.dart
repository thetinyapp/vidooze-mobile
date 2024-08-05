import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/domain/entity/analytics/login_failure_analytics_event/login_failure_analytics_event.dart';
import 'package:vidooze_mobile/domain/entity/analytics/login_success_analytics_event/login_success_analytics_event.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/domain/repository/auth_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_page_store.dart';
import 'package:vidooze_mobile/presentation/pages/sign_up/events/signup_event.dart';

// Include generated file
part 'signup_page_store.g.dart';

class SignUpPageStore extends _SignUpPageStore with _$SignUpPageStore {
  SignUpPageStore({
    required super.authRepository,
    required super.analyticsRepository,
  });
}

abstract class _SignUpPageStore extends BasePageStore with Store {
  final AuthRepository _authRepository;
  final AnalyticsRepository _analyticsRepository;

  @observable
  SignupEvent event = SignupEvent.idle();

  _SignUpPageStore({
    required AuthRepository authRepository,
    required AnalyticsRepository analyticsRepository,
  })  : _authRepository = authRepository,
        _analyticsRepository = analyticsRepository;

  _handleLoginSuccess(bool _value) async {
    await _analyticsRepository
        .logEvent(LoginSuccessAnalyticsEvent(type: "form"));
    event = SignupEvent.success();
  }

  _handleLoginFailure(BaseError _value) async {
    await _analyticsRepository
        .logEvent(LoginFailureAnalyticsEvent(type: "form"));
    event = SignupEvent.error("Failed to signup");
  }

  login() async {
    event = SignupEvent.authorisationInProgress();
    // final result = await executeCall(() => _authRepository.login());
    // result
    //   ..onSuccess(_handleLoginSuccess)
    //   ..onFailure(_handleLoginFailure);
  }
}
