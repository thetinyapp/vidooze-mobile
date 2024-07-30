import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/domain/repository/auth_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/components/space.dart';
import 'package:vidooze_mobile/presentation/extensions/app_router_extension.dart';
import 'package:vidooze_mobile/presentation/pages/auth/auth_page_store.dart';
import 'package:vidooze_mobile/presentation/pages/auth/events/auth_event.dart';
import 'package:vidooze_mobile/presentation/router/app_router.dart';

@RoutePage()
class AuthPage extends BaseStatefulPageWidget<AuthPageStore> {
  const AuthPage({super.key}) : super(pageName: "Auth");

  @override
  BasePageState<AuthPageStore> createState() => _AuthPageState();
}

class _AuthPageState extends BasePageState<AuthPageStore> {
  final TextEditingController _controller = TextEditingController();

  ReactionDisposer? _eventDisposer;

  @override
  void initState() {
    super.initState();
    _eventDisposer = when(
      (_) => store.event is AuthSuccess,
      () => context.goToAndReplace(const HomeRoute()),
    );
  }

  @override
  AuthPageStore createStore() => AuthPageStore(
        authRepository: locator.get<AuthRepository>(),
        analyticsRepository: locator.get<AnalyticsRepository>(),
      );

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, AuthPageStore store) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Login"),
    );
  }

  @override
  Widget buildBody(BuildContext context, AuthPageStore store) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter email',
              ),
            ),
            const Space(
              y: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                store.login();
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _eventDisposer?.call();
    super.dispose();
  }
}
