import 'package:flutter/material.dart';
import 'package:vidooze_mobile/di/configure_di.dart';
import 'package:vidooze_mobile/domain/repository/app_repository.dart';
import 'package:vidooze_mobile/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  try {
    await locator.get<AppRepository>().init();
  } catch (e) {
    debugPrint(e.toString());
  }
  runApp(const App());
}
