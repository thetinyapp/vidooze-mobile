import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/domain/repository/summarizer_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/components/space.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/header.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/key_moments_ui.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/summarizer_title.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/summary_search_ui.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/summary_ui.dart';
import 'package:vidooze_mobile/presentation/pages/summary/model/summarizer_tab.dart';
import 'package:vidooze_mobile/presentation/pages/summary/summary_page_store.dart';

@RoutePage()
class SummaryPage extends BaseStatefulPageWidget<SummaryPageStore> {
  final String videoUrl;

  const SummaryPage({super.key, required this.videoUrl})
      : super(pageName: "Summary");

  @override
  BasePageState<SummaryPageStore> createState() => _SummaryPageState();
}

class _SummaryPageState extends BasePageState<SummaryPageStore> {
  Widget _buildTitle() {
    return SummarizerTitle(
      title: store.pageTitle,
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const Space(y: 24),
          switch (store.selectedTab) {
            SummarizerTab.keyMoments => const KeyMomentsUi(
                moments: [],
              ),
            SummarizerTab.summary => const SummaryUi(),
            SummarizerTab.search => const SummarySearchUi(),
          }
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context, SummaryPageStore store) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummaryHeader(
          selectedTab: store.selectedTab,
          onSelected: store.selectTab,
        ),
        _buildContent()
      ],
    );
  }

  @override
  SummaryPageStore createStore() => SummaryPageStore(
        summarizerRepository: locator.get<SummarizerRepository>(),
        analyticsRepository: locator.get<AnalyticsRepository>(),
        videoUrl: (widget as SummaryPage).videoUrl,
      );
}
