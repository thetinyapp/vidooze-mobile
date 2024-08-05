import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/domain/repository/auth_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/components/space.dart';
import 'package:vidooze_mobile/presentation/extensions/app_router_extension.dart';
import 'package:vidooze_mobile/presentation/pages/login/events/login_event.dart';
import 'package:vidooze_mobile/presentation/pages/login/login_page_store.dart';
import 'package:vidooze_mobile/presentation/router/app_router.dart';

@RoutePage()
class LoginPage extends BaseStatefulPageWidget<LoginPageStore> {
  const LoginPage({super.key}) : super(pageName: "Login");

  @override
  BasePageState<LoginPageStore> createState() => _AuthPageState();
}

class _AuthPageState extends BasePageState<LoginPageStore> {
  final TextEditingController _controller = TextEditingController();

  ReactionDisposer? _eventDisposer;

  @override
  void initState() {
    super.initState();
    _eventDisposer = when(
      (_) => store.event is Success,
      () => context.goToAndReplace(const HomeRoute()),
    );
  }

  @override
  LoginPageStore createStore() => LoginPageStore(
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

  Widget _buildSubmitButton(BuildContext context) {
    final theme = Theme.of(context).elevatedButtonTheme;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: theme.style,
        onPressed: () => store.login(),
        child: const Text("Login"),
      ),
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    final theme = Theme.of(context).outlinedButtonTheme;
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: theme.style,
        onPressed: () => context.goTo(const SignUpRoute()),
        child: const Text("Create Account"),
      ),
    );
  }

  Widget _buildForgetPassword(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        "Forget Password ?",
        textAlign: TextAlign.end,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  Widget _buildOAuthLogin() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(3.0),
          child: const Image(
            image: AssetImage('assets/icons/google_icon.png'),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1,
            ),
          ),
        ),
        const Space(x: 30),
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(10.0),
          child: const Image(
            image: AssetImage('assets/icons/apple_icon.png'),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildOrSignInWith() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: 50,
          color: Colors.white.withOpacity(0.5),
        ),
        const Space(x: 20),
        const Text("Or sign in with"),
        const Space(x: 20),
        Container(
          height: 1,
          width: 50,
          color: Colors.white.withOpacity(0.5),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(
          BuildContext context, LoginPageStore store) =>
      AppBar(
        backgroundColor: Colors.transparent,
      );

  @override
  Widget buildBody(BuildContext context, LoginPageStore store) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          const Space(y: 40),
          _buildEmailInput(context),
          const Space(y: 10),
          _buildForgetPassword(context),
          const Space(y: 40),
          _buildSubmitButton(context),
          const Space(y: 20),
          _buildCreateAccountButton(context),
          const Space(y: 30),
          _buildOrSignInWith(),
          const Space(y: 30),
          _buildOAuthLogin(),
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
