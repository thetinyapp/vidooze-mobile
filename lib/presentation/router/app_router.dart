import 'package:auto_route/auto_route.dart';
import 'package:vidooze_mobile/presentation/pages/home/home_page.dart';
import 'package:vidooze_mobile/presentation/pages/login//login_page.dart';
import 'package:vidooze_mobile/presentation/pages/profile/profile_page.dart';
import 'package:vidooze_mobile/presentation/pages/sign_up/signup_page.dart';
import 'package:vidooze_mobile/presentation/pages/splash/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: "/", page: SplashRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ];
}
