abstract class AnalyticsDataSource {
  Future setUserId(String id);

  Future setUserProperties(Map<String, dynamic> properties);

  Future logScreenView(String screenView);

  Future logEvent(String event, Map<String, dynamic> parameters);

  Future setCommonProperties(Map<String, dynamic> properties);
}

class FirebaseAnalyticsDataSource implements AnalyticsDataSource {
  @override
  Future logEvent(String event, Map<String, dynamic> parameters) {
    return Future.value();
  }

  @override
  Future logScreenView(String screenView) {
    return Future.value();
  }

  @override
  Future setCommonProperties(Map<String, dynamic> properties) {
    return Future.value();
  }

  @override
  Future setUserId(String id) {
    return Future.value();
  }

  @override
  Future setUserProperties(Map<String, dynamic> properties) {
    return Future.value();
  }
}
