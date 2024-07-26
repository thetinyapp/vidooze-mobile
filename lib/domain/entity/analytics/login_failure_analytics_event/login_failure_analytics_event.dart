import 'package:json_annotation/json_annotation.dart';
import 'package:vidooze_mobile/domain/entity/analytics/base_analytics_event.dart';

part 'login_failure_analytics_event.g.dart';

@JsonSerializable(createFactory: false)
class LoginFailureAnalyticsEvent extends BaseAnalyticsEvent {
  @JsonKey(name: "type")
  final String type;

  LoginFailureAnalyticsEvent({
    required this.type,
  }) : super(eventName: "Login Failed");

  @override
  Map<String, dynamic> toJson() => _$LoginFailureAnalyticsEventToJson(this);
}
