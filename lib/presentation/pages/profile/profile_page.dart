import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/repository/token_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/extensions/app_router_extension.dart';
import 'package:vidooze_mobile/presentation/extensions/widget_extension.dart';
import 'package:vidooze_mobile/presentation/pages/profile/profile_page_store.dart';
import 'package:vidooze_mobile/presentation/router/app_router.dart';

@RoutePage()
class ProfilePage extends BaseStatefulPageWidget<ProfilePageStore> {
  const ProfilePage({super.key}) : super(pageName: "Profile");

  @override
  BasePageState<ProfilePageStore> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageState<ProfilePageStore> {
  _handleLogoutClick() async {
    final result = await store.clearToken();
    result
      ..onSuccess((_) => context.replaceRouteStack([const AuthRoute()]))
      ..onFailure((_) => context.showSnackBar(message: "Failed to logout"));
  }

  @override
  PreferredSizeWidget? buildAppBar(
      BuildContext context, ProfilePageStore store) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }

  @override
  Widget buildBody(BuildContext context, ProfilePageStore store) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleLogoutClick,
              child: const Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ProfilePageStore createStore() =>
      ProfilePageStore(tokenRepository: locator.get<TokenRepository>());
}
