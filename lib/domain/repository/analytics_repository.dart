import 'package:vidooze_mobile/domain/entity/analytics/analytics_common_properties/analytics_common_properties.dart';
import 'package:vidooze_mobile/domain/entity/analytics/analytics_user_properties/analytics_user_properties.dart';
import 'package:vidooze_mobile/domain/entity/analytics/base_analytics_event.dart';

abstract class AnalyticsRepository {
  Future setUserId(String id);

  Future setUserProperties(AnalyticsUserProperties properties);

  Future logScreenView(String screenView);

  Future logEvent<T extends BaseAnalyticsEvent>(T event);

  Future setCommonProperties(AnalyticsCommonProperties properties);
}
