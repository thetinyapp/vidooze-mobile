import 'package:flutter/widgets.dart';
import 'package:vidooze_mobile/presentation/components/space.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/summarizer_title.dart';

class SummaryUi extends StatelessWidget {
  final String title;
  final String summary;
  final String synopsis;

  const SummaryUi({
    super.key,
    required this.title,
    required this.summary,
    required this.synopsis,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummarizerTitle(title: title),
        const Space(y: 8),
        _BodyText(
          text: summary,
        ),
        const Space(y: 24),
        const SummarizerTitle(title: "Synopsis"),
        const Space(y: 8),
        _BodyText(text: synopsis)
      ],
    );
  }
}

class _BodyText extends StatelessWidget {
  final String text;

  const _BodyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: Color.fromARGB(255, 205, 205, 205),
        fontWeight: FontWeight.w400,
        height: 2,
      ),
    );
  }
}
