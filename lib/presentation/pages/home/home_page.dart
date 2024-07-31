import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/extensions/app_router_extension.dart';
import 'package:vidooze_mobile/presentation/pages/home/home_page_store.dart';
import 'package:vidooze_mobile/presentation/router/app_router.dart';

@RoutePage()
class HomePage extends BaseStatefulPageWidget<HomePageStore> {
  const HomePage({super.key}) : super(pageName: "Home");

  @override
  BasePageState<HomePageStore> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePageStore> {
  @override
  HomePageStore createStore() => HomePageStore();

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, HomePageStore store) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      leading: IconButton(
        icon: const Icon(Icons.person),
        tooltip: "Profile",
        onPressed: () => context.goTo(const ProfileRoute()),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context, HomePageStore store) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[],
      ),
    );
  }
}
