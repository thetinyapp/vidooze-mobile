import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/presentation/app_store.dart';
import 'package:vidooze_mobile/presentation/router/app_router.dart';
import 'package:vidooze_mobile/presentation/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appStore = locator.get<AppStore>();
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final themeMode = _appStore.theme.when(
          system: () => ThemeMode.system,
          light: () => ThemeMode.light,
          dark: () => ThemeMode.dark,
        );

        return MaterialApp.router(
          themeMode: ThemeMode.dark,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
