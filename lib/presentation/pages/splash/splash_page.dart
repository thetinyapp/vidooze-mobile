import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/repository/user_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/components/space.dart';
import 'package:vidooze_mobile/presentation/extensions/app_router_extension.dart';
import 'package:vidooze_mobile/presentation/pages/splash/splash_page_store.dart';
import 'package:vidooze_mobile/presentation/router/app_router.dart';

@RoutePage()
class SplashPage extends BaseStatefulPageWidget<SplashPageStore> {
  const SplashPage({super.key}) : super(pageName: "Splash");

  @override
  BasePageState<SplashPageStore> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPageStore> {
  @override
  void initState() {
    super.initState();
    disposers.add(reaction((_) => store.event, (event) {
      event.maybeWhen(
        authorised: () => context.goToAndReplace(
          SummaryRoute(
            videoUrl: "https://www.youtube.com/watch?v=nIg2Jn_45zc",
            title: "Lex Fridman Podcast with Sam Altman",
          ),
        ),
        unauthorised: () => context.goToAndReplace(const LoginRoute()),
        orElse: () => {},
      );
    }));
  }

  @override
  Widget buildBody(BuildContext context, SplashPageStore store) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Space(y: 20),
          Text(
            "Vidooze\nSplash Screen",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  @override
  SplashPageStore createStore() => SplashPageStore(
        userRepository: locator.get<UserRepository>(),
      );
}
