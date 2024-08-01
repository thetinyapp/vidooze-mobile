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

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's get\nstarted",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          "Login",
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 80),
        )
      ],
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    ;
    return TextField(
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        border: Theme.of(context).inputDecorationTheme.border,
        floatingLabelStyle:
            Theme.of(context).inputDecorationTheme.floatingLabelStyle,
        labelText: "Email",
        prefixIcon: const Icon(Icons.email_outlined),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context, AuthPageStore store) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          const Space(y: 40),
          _buildEmailInput(context),
        ],
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
