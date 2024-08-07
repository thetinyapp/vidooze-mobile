import 'package:mobx/mobx.dart';
import 'package:vidooze_mobile/domain/entity/analytics/summarizer_error_analytics_event/summarizer_error_analytics_event.dart';
import 'package:vidooze_mobile/domain/entity/analytics/summarizer_success_analytics_event/summarizer_success_analytics_event.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';
import 'package:vidooze_mobile/domain/repository/summarizer_repository.dart';
import 'package:vidooze_mobile/presentation/base/base_page_store.dart';
import 'package:vidooze_mobile/presentation/pages/summary/events/summary_event.dart';
import 'package:vidooze_mobile/presentation/pages/summary/model/summarizer_tab.dart';

// Include generated file
part 'summary_page_store.g.dart';

class SummaryPageStore extends _SummaryPageStore with _$SummaryPageStore {
  SummaryPageStore({
    required super.summarizerRepository,
    required super.analyticsRepository,
    required super.videoUrl,
  });
}

abstract class _SummaryPageStore extends BasePageStore with Store {
  @observable
  SummaryEvent event = SummaryEvent.inProgress();

  @observable
  SummarizerTab selectedTab = SummarizerTab.keyMoments;

  final AnalyticsRepository _analyticsRepository;
  final SummarizerRepository _summarizerRepository;
  final String _videoUrl;

  _SummaryPageStore({
    required AnalyticsRepository analyticsRepository,
    required SummarizerRepository summarizerRepository,
    required String videoUrl,
  })  : _analyticsRepository = analyticsRepository,
        _summarizerRepository = summarizerRepository,
        _videoUrl = videoUrl;

  @override
  initState() {
    super.initState();
    _summarize();
  }

  @action
  selectTab(SummarizerTab tab) => selectedTab = tab;

  _summarize() async {
    final result = await executeCall(
      () => _summarizerRepository.summarize(videoUrl: _videoUrl),
    );
    result
      ..onSuccess((data) {
        event = SummaryEvent.success(data);
        _analyticsRepository.logEvent(
            SummarizerSuccessAnalyticsEvent(id: data.id, videoUrl: _videoUrl));
      })
      ..onFailure((error) {
        event = SummaryEvent.error("Something went wrong");
        _analyticsRepository
            .logEvent(SummarizerErrorAnalyticsEvent(videoUrl: _videoUrl));
      });
  }
}
