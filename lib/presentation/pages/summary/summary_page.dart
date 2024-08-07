import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/domain/repository/summarizer_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/header.dart';
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
    return Text(
      store.pageTitle,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 2,
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [_buildTitle()],
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
