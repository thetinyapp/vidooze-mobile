import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/pages/home/home_page_store.dart';

@RoutePage()
class HomePage extends BaseStatefulPageWidget<HomePageStore> {
  const HomePage({super.key});

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
      title: const Text("Home"),
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
