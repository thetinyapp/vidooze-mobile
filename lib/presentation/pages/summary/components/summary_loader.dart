import 'package:flutter/widgets.dart';

class SummaryLoader extends StatelessWidget {
  const SummaryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _LoaderText(
          data: LoaderData(
            disabled: false,
            text: "Some title will come here",
            type: LoaderType.summarizing,
          ),
        ),
        _LoaderText(
          data: LoaderData(
            disabled: false,
            text: "Some title will come here",
            type: LoaderType.loading,
          ),
        ),
      ],
    );
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
