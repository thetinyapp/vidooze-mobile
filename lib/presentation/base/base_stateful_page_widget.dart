import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_page_store.dart';

abstract class BaseStatefulPageWidget<T extends BasePageStore>
    extends StatefulWidget {
  final String pageName;

  const BaseStatefulPageWidget({super.key, required this.pageName});

  @override
  BasePageState<T> createState();
}

abstract class BasePageState<T extends BasePageStore>
    extends State<BaseStatefulPageWidget<T>> {
  late T store;

  final disposers = <ReactionDisposer>[];

  T createStore();

  final AnalyticsRepository _analyticsRepository =
      locator.get<AnalyticsRepository>();

  Widget buildBody(BuildContext context, T store);

  PreferredSizeWidget? buildAppBar(BuildContext context, T store) => null;

  @override
  void initState() {
    super.initState();
    _analyticsRepository.logScreenView(widget.pageName);
    store = createStore()..initState();
    disposers.add(
      when((_) => store.isUnAuthorised, () {
        // redirect to auth
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: buildAppBar(context, store),
          body: SafeArea(
            child: buildBody(context, store),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    for (var disposer in disposers) {
      disposer();
    }
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
