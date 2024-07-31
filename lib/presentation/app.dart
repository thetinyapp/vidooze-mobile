import 'package:flutter/material.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/repository/user_repository.dart';
import 'package:vidooze_mobile/presentation/extensions/app_router_extension.dart';
import 'package:vidooze_mobile/presentation/router/app_router.dart';
import 'package:vidooze_mobile/presentation/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    final repository = locator.get<UserRepository>();
    repository.isLoggedIn().then((result) {
      result.onSuccess((it) {
        if (it) {
          context.goToAndReplace(const HomeRoute());
        }
      });
    }).catchError((err) {
      debugPrint(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
