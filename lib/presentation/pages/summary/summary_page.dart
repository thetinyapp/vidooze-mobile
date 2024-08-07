import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/domain/repository/summarizer_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_stateful_page_widget.dart';
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
  @override
  Widget buildBody(BuildContext context, SummaryPageStore store) {
    return Container();
  }

  @override
  SummaryPageStore createStore() => SummaryPageStore(
        summarizerRepository: locator.get<SummarizerRepository>(),
        analyticsRepository: locator.get<AnalyticsRepository>(),
        videoUrl: (widget as SummaryPage).videoUrl,
      );
}
