import 'package:flutter/material.dart';
import 'package:vidooze_mobile/domain/entity/summary/summary.dart';
import 'package:vidooze_mobile/presentation/components/IIcons.dart';
import 'package:vidooze_mobile/presentation/components/space.dart';
import 'package:vidooze_mobile/presentation/pages/summary/components/summarizer_title.dart';

class KeyMomentsUi extends StatelessWidget {
  final List<KeyMoment> moments;

  const KeyMomentsUi({
    super.key,
    required this.moments,
  });

  @override
  Widget build(BuildContext context) {
    if (moments.isEmpty) {
      return const Center(
        child: SummarizerTitle(title: "No key moments"),
      );
    }

    return ListView.separated(
      separatorBuilder: (_, __) => const Space(y: 16),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: moments.length,
      itemBuilder: (_, index) => _KeyMoment(
        data: moments[index],
      ),
    );
  }
}

class _KeyMoment extends StatelessWidget {
  final KeyMoment data;

  const _KeyMoment({super.key, required this.data});

  Widget _buildImage() {
    return SizedBox(
      width: 90,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _getTitle() {
    return Text(
      data.title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildTimestamp() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IIcons.play,
        const Space(x: 8),
        Text(
          "Starts at ${data.timestamp}",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromARGB(255, 234, 236, 240),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            _buildImage(),
            const Space(x: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _getTitle(),
                  const Space(y: 8),
                  _buildTimestamp(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
