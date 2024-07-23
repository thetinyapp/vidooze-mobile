import 'package:auto_route/auto_route.dart';
import 'package:vidooze_mobile/presentation/pages/auth/auth_page.dart';
import 'package:vidooze_mobile/presentation/pages/home/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: "/", page: AuthRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
