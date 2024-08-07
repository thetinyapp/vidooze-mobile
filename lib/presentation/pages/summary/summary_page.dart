import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/entity/summary/summary.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/domain/repository/summarizer_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/components/space.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/header.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/key_moments_ui.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/summarizer_title.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/summary_loader.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/summary_search_ui.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/summary_ui.dart';
import 'package:vidooze_mobile/presentation/pages/summary/model/summarizer_tab.dart';
import 'package:vidooze_mobile/presentation/pages/summary/summary_page_store.dart';

@RoutePage()
class SummaryPage extends BaseStatefulPageWidget<SummaryPageStore> {
  final String videoUrl;
  final String title;

  const SummaryPage(
    this.title, {
    super.key,
    required this.videoUrl,
  }) : super(pageName: "Summary");

  @override
  BasePageState<SummaryPageStore> createState() => _SummaryPageState();
}

class _SummaryPageState extends BasePageState<SummaryPageStore> {
  Widget _buildTitle() {
    return SummarizerTitle(
      title: store.pageTitle,
    );
  }

  Widget _buildContent({
    required String title,
    required String summary,
    required String synopsis,
    required List<KeyMoment> keyMoments,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const Space(y: 24),
          switch (store.selectedTab) {
            SummarizerTab.keyMoments => KeyMomentsUi(
                moments: keyMoments,
              ),
            SummarizerTab.summary => SummaryUi(
                title: title,
                summary: summary,
                synopsis: synopsis,
              ),
            SummarizerTab.search => const SummarySearchUi(),
          }
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context, SummaryPageStore store) {
    return store.event.when(
      inProgress: () => const SummaryLoader(),
      error: (message) => Text(message),
      success: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SummaryHeader(
            selectedTab: store.selectedTab,
            onSelected: store.selectTab,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Container(
                child: _buildContent(
                  title: store.title,
                  summary: data.summary,
                  synopsis: data.synopsis,
                  keyMoments: data.keyMoments,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  SummaryPageStore createStore() => SummaryPageStore(
        summarizerRepository: locator.get<SummarizerRepository>(),
        analyticsRepository: locator.get<AnalyticsRepository>(),
        videoUrl: (widget as SummaryPage).videoUrl,
        title: (widget as SummaryPage).title,
      );
}
