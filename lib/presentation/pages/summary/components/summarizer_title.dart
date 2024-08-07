import 'package:flutter/widgets.dart';

class SummarizerTitle extends StatelessWidget {
  final String title;

  const SummarizerTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 2,
      ),
    );
  }
}
