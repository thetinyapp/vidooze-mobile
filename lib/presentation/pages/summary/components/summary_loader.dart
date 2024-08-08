import 'package:flutter/widgets.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/summarizer_title.dart';

class SummaryLoader extends StatelessWidget {
  const SummaryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SummarizerTitle(title: "Summarizing...")],
      ),
    );
    // return Column(
    //   children: [
    //     _LoaderText(
    //       data: LoaderData(
    //         disabled: false,
    //         text: "Some title will come here",
    //         type: LoaderType.summarizing,
    //       ),
    //     ),
    //     _LoaderText(
    //       data: LoaderData(
    //         disabled: false,
    //         text: "Some title will come here",
    //         type: LoaderType.loading,
    //       ),
    //     ),
    //   ],
    // );
  }
}

class _LoaderText extends StatelessWidget {
  final LoaderData data;

  const _LoaderText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

enum LoaderType { loading, checked, summarizing }

class LoaderData {
  final LoaderType type;
  final String text;
  final bool disabled;

  LoaderData({
    required this.type,
    required this.text,
    required this.disabled,
  });
}
