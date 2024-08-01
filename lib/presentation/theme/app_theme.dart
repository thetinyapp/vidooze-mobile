import 'package:flutter/material.dart';
import 'package:vidooze_mobile/presentation/theme/input_decoration_theme.dart';
import 'package:vidooze_mobile/presentation/theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: const Color.fromARGB(255, 240, 240, 240),
      textTheme: TTextTheme.lightTheme,
      inputDecorationTheme: TInputDecorationTheme.lightTheme);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: const Color.fromARGB(255, 1, 1, 1),
    textTheme: TTextTheme.darkTheme,
    inputDecorationTheme: TInputDecorationTheme.darkTheme,
  );
}
