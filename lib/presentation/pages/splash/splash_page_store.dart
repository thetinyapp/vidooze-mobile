import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/domain/repository/user_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_page_store.dart';
import 'package:vidooze_mobile/presentation/pages/splash/events/splash_event.dart';

// Include generated file
part 'splash_page_store.g.dart';

class SplashPageStore extends _SplashPageStore with _$SplashPageStore {
  SplashPageStore({required super.userRepository});
}

abstract class _SplashPageStore extends BasePageStore with Store {
  final UserRepository _userRepository;

  @observable
  SplashEvent event = SplashEvent.pending();

  _SplashPageStore({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  init() {
    super.init();
    _userRepository.isLoggedIn().then((result) {
      result.onSuccess((value) {
        event = value ? SplashEvent.authorised() : SplashEvent.unauthorised();
      });
    });
  }
}
