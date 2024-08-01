import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/domain/repository/auth_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/components/space.dart';
import 'package:vidooze_mobile/presentation/extensions/app_router_extension.dart';
import 'package:vidooze_mobile/presentation/pages/auth/events/auth_event.dart';
import 'package:vidooze_mobile/presentation/pages/sign_up/signup_page_store.dart';
import 'package:vidooze_mobile/presentation/router/app_router.dart';

@RoutePage()
class SignUpPage extends BaseStatefulPageWidget<SignUpPageStore> {
  const SignUpPage({super.key}) : super(pageName: "Auth");

  @override
  BasePageState<SignUpPageStore> createState() => _SignUpPageState();
}

class _SignUpPageState extends BasePageState<SignUpPageStore> {
  ReactionDisposer? _eventDisposer;

  bool _isPasswordObscured = true;

  @override
  void initState() {
    super.initState();
    _eventDisposer = when(
      (_) => store.event is AuthSuccess,
      () => context.goToAndReplace(const HomeRoute()),
    );
  }

  @override
  SignUpPageStore createStore() => SignUpPageStore(
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
          "Signup",
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 80),
        )
      ],
    );
  }

  Widget _buildEmailInput(BuildContext context) {
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

  Widget _buildPasswordInput(BuildContext context) {
    return TextField(
      obscureText: _isPasswordObscured,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        border: Theme.of(context).inputDecorationTheme.border,
        floatingLabelStyle:
            Theme.of(context).inputDecorationTheme.floatingLabelStyle,
        labelText: "Password",
        prefixIcon: const Icon(Icons.password_outlined),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: () => setState(() {
            _isPasswordObscured = !_isPasswordObscured;
          }),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    final theme = Theme.of(context).elevatedButtonTheme;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: theme.style,
        onPressed: () {},
        child: const Text("Signup"),
      ),
    );
  }

  Widget _buildFirstName(BuildContext context) {
    return Expanded(
      child: TextField(
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          border: Theme.of(context).inputDecorationTheme.border,
          floatingLabelStyle:
              Theme.of(context).inputDecorationTheme.floatingLabelStyle,
          labelText: "First name",
          prefixIcon: const Icon(Icons.person_outline_outlined),
        ),
      ),
    );
  }

  Widget _buildLastName(BuildContext context) {
    return Expanded(
      child: TextField(
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          border: Theme.of(context).inputDecorationTheme.border,
          floatingLabelStyle:
              Theme.of(context).inputDecorationTheme.floatingLabelStyle,
          labelText: "Last name",
          prefixIcon: const Icon(Icons.person_outline_outlined),
        ),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context, SignUpPageStore store) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          const Space(y: 40),
          Row(
            children: [
              _buildFirstName(context),
              const Space(x: 12),
              _buildLastName(context),
            ],
          ),
          const Space(y: 20),
          _buildEmailInput(context),
          const Space(y: 20),
          _buildPasswordInput(context),
          const Space(y: 20),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _eventDisposer?.call();
    super.dispose();
  }
}
