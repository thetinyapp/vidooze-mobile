import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: const Color.fromARGB(255, 240, 240, 240),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: const Color.fromARGB(255, 1, 1, 1),
  );
}
