import 'package:json_annotation/json_annotation.dart';
import 'package:vidooze_mobile/domain/entity/analytics/base_analytics_event.dart';

part 'summarizer_success_analytics_event.g.dart';

@JsonSerializable(createFactory: false)
class SummarizerSuccessAnalyticsEvent extends BaseAnalyticsEvent {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "video_url")
  final String videoUrl;

  SummarizerSuccessAnalyticsEvent({
    required this.id,
    required this.videoUrl,
  }) : super(eventName: "Summarizer Success");

  @override
  Map<String, dynamic> toJson() =>
      _$SummarizerSuccessAnalyticsEventToJson(this);
}
