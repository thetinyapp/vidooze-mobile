import 'package:flutter/material.dart';

extension WidgetExtension on BuildContext {
  showSnackBar({required String message}) {
    if (mounted) {
      final snackBar = SnackBar(
        content: Text(message),
      );
      ScaffoldMessenger.of(this).showSnackBar(snackBar);
    }
  }

  clearFocus() {
    if (mounted) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
