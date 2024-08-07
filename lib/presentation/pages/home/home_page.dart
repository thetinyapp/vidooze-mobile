import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/components/space.dart';
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
  final _textController = TextEditingController(
      text: "https://www.youtube.com/watch?v=nIg2Jn_45zc");

  final title = "Lex Fridman Podcast with Sam Altman";

  @override
  HomePageStore createStore() => HomePageStore();

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, HomePageStore store) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      leading: IconButton(
        icon: const Icon(Icons.person),
        tooltip: "Profile",
        onPressed: () => context.goTo(const ProfileRoute()),
      ),
    );
  }

  Widget _buildYoutubeInput(BuildContext context) {
    return TextField(
      controller: _textController,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        border: Theme.of(context).inputDecorationTheme.border,
        floatingLabelStyle:
            Theme.of(context).inputDecorationTheme.floatingLabelStyle,
        labelText: "Youtube link",
        prefixIcon: const Icon(Icons.play_circle),
      ),
    );
  }

  Widget _buildSummarizeButton(BuildContext context) {
    final theme = Theme.of(context).elevatedButtonTheme;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: theme.style,
        onPressed: () {
          context.goTo(
            SummaryRoute(title: title, videoUrl: _textController.text),
          );
        },
        child: const Text("Summarize video"),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context, HomePageStore store) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: Icon(
                Icons.youtube_searched_for,
                size: 100,
              ),
            )),
            _buildYoutubeInput(context),
            const Space(y: 16),
            _buildSummarizeButton(context)
          ],
        ),
      ),
    );
  }
}
