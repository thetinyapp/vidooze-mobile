import 'package:flutter/material.dart';

class TInputDecorationTheme {
  TInputDecorationTheme._();

  static InputDecorationTheme lightTheme = const InputDecorationTheme(
    border: OutlineInputBorder(),
    floatingLabelStyle: TextStyle(fontSize: 16),
  );

  static InputDecorationTheme darkTheme = const InputDecorationTheme(
    border: OutlineInputBorder(),
    floatingLabelStyle: TextStyle(fontSize: 16),
  );
}
