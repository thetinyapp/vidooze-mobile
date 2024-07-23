import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/pages/auth/auth_page_store.dart';

@RoutePage()
class AuthPage extends BaseStatefulPageWidget<AuthPageStore> {
  const AuthPage({super.key});

  @override
  BasePageState<AuthPageStore> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<AuthPageStore> {
  @override
  AuthPageStore createStore() => AuthPageStore();

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, AuthPageStore store) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Login"),
    );
  }

  @override
  Widget buildBody(BuildContext context, AuthPageStore store) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[],
      ),
    );
  }
}
