import 'package:vidooze_mobile/data/data_sources/analytics_data_source.dart';
import 'package:vidooze_mobile/domain/entity/analytics/analytics_common_properties/analytics_common_properties.dart';
import 'package:vidooze_mobile/domain/entity/analytics/analytics_user_properties/analytics_user_properties.dart';
import 'package:vidooze_mobile/domain/entity/analytics/base_analytics_event.dart';
import 'package:vidooze_mobile/domain/repository/analytics_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final AnalyticsDataSource _dataSource;

  AnalyticsRepositoryImpl({required AnalyticsDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future logEvent<T extends BaseAnalyticsEvent>(T event) =>
      _dataSource.logEvent(event.eventName, event.toJson());

  @override
  Future logScreenView(String screenView) =>
      _dataSource.logScreenView(screenView);

  @override
  Future setCommonProperties(AnalyticsCommonProperties properties) =>
      _dataSource.setCommonProperties(properties.toJson());

  @override
  Future setUserId(String id) => _dataSource.setUserId(id);

  @override
  Future setUserProperties(AnalyticsUserProperties properties) =>
      _dataSource.setUserProperties(properties.toJson());
}
