import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/repository/app_repository.dart';
import 'package:vidooze_mobile/domain/repository/error_reporting_repository.dart';
import 'package:vidooze_mobile/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await _initApp();
  _initErrorReporting();
  runApp(const App());
}

_initApp() async {
  final appRepository = locator.get<AppRepository>();
  await appRepository.init();
}

void _initErrorReporting() {
  final errorReportingRepository = locator.get<ErrorReportingRepository>();
  FlutterError.onError = (errorDetails) {
    errorReportingRepository
        .reportFlutterError(
          details: errorDetails,
          isFatal: true,
        )
        .then((_) {});
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    errorReportingRepository
        .reportError(
      error: error,
      stackTrace: stack,
      source: "PLATFORM_DISPATCHER",
      isFatal: true,
    )
        .then((_) {
      print("Successfully reported Error");
    }).catchError((err) {
      print("Failed to Report Error: $err");
      print(err);
    });

    return true;
  };
}
