import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/domain/entity/analytics/login_failure_analytics_event/login_failure_analytics_event.dart';
import 'package:vidooze_mobile/domain/entity/analytics/login_success_analytics_event/login_success_analytics_event.dart';
import 'package:vidooze_mobile/domain/entity/error.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/domain/repository/auth_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_page_store.dart';
import 'package:vidooze_mobile/presentation/pages/auth/events/auth_event.dart';

// Include generated file
part 'auth_page_store.g.dart';

class AuthPageStore extends _AuthPageStore with _$AuthPageStore {
  AuthPageStore({
    required super.authRepository,
    required super.analyticsRepository,
  });
}

abstract class _AuthPageStore extends BasePageStore with Store {
  final AuthRepository _authRepository;
  final AnalyticsRepository _analyticsRepository;

  @observable
  AuthEvent event = AuthEvent.idle();

  _AuthPageStore({
    required AuthRepository authRepository,
    required AnalyticsRepository analyticsRepository,
  })  : _authRepository = authRepository,
        _analyticsRepository = analyticsRepository;

  _handleLoginSuccess(bool _value) async {
    await _analyticsRepository
        .logEvent(LoginSuccessAnalyticsEvent(type: "form"));
    event = AuthEvent.success();
  }

  _handleLoginFailure(BaseError _value) async {
    await _analyticsRepository
        .logEvent(LoginFailureAnalyticsEvent(type: "form"));
    event = AuthEvent.error("Failed to login");
  }

  login() async {
    event = AuthEvent.authorisationInProgress();
    final result = await executeApiCall(() => _authRepository.login());
    result
      ..onSuccess(_handleLoginSuccess)
      ..onFailure(_handleLoginFailure);
  }
}
