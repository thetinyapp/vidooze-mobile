import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static ElevatedButtonThemeData lightTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(Colors.blue),
      textStyle: const WidgetStatePropertyAll(TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 16),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );

  static ElevatedButtonThemeData darkTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(Colors.blue),
      textStyle: const WidgetStatePropertyAll(TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 16),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}
