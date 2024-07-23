import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vidooze_mobile/presentation/base/base_page_store.dart';
import 'package:mobx/mobx.dart';

abstract class BaseStatefulPageWidget<T extends BasePageStore>
    extends StatefulWidget {
  const BaseStatefulPageWidget({super.key});

  @override
  BasePageState<T> createState();
}

abstract class BasePageState<T extends BasePageStore>
    extends State<BaseStatefulPageWidget<T>> {
  late T store;

  T createStore();

  ReactionDisposer? _unAuthorisedDisposer;

  Widget buildBody(BuildContext context, T store);

  PreferredSizeWidget? buildAppBar(BuildContext context, T store) => null;

  @override
  void initState() {
    super.initState();
    store = createStore()..init();
    _unAuthorisedDisposer = when((_) => store.isUnAuthorised, () {
      // redirect to auth
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: buildAppBar(context, store),
          body: buildBody(context, store),
        );
      },
    );
  }

  @override
  void dispose() {
    _unAuthorisedDisposer?.call();
    store.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    safely(() {
      super.setState(fn);
    });
  }

  // Use this to when performing operations that need context
  void safely(VoidCallback body) {
    if (mounted && context.mounted) {
      body();
    }
  }
}
