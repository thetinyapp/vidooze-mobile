import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/di/configure_di.dart';
import 'package:flutter_starter_kit/presentation/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}