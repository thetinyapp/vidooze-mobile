import 'package:json_annotation/json_annotation.dart';
import 'package:vidooze_mobile/domain/entity/analytics/base_analytics_event.dart';

part 'summarizer_error_analytics_event.g.dart';

@JsonSerializable(createFactory: false)
class SummarizerErrorAnalyticsEvent extends BaseAnalyticsEvent {
  @JsonKey(name: "video_url")
  final String videoUrl;

  SummarizerErrorAnalyticsEvent({
    required this.videoUrl,
  }) : super(eventName: "Summarizer Error");

  @override
  Map<String, dynamic> toJson() => _$SummarizerErrorAnalyticsEventToJson(this);
}
