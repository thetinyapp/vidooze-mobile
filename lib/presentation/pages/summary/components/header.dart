import 'package:flutter/material.dart';
import 'package:vidooze_mobile/presentation/components/IIcons.dart';
import 'package:vidooze_mobile/presentation/components/space.dart';
import 'package:vidooze_mobile/presentation/pages/summary/model/summarizer_tab.dart';

class SummaryHeader extends StatelessWidget {
  final SummarizerTab selectedTab;
  final void Function(SummarizerTab) onSelected;

  const SummaryHeader({
    super.key,
    required this.selectedTab,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Tab(
            selected: selectedTab == SummarizerTab.keyMoments,
            icon: IIcons.zap,
            onClick: () => onSelected(SummarizerTab.keyMoments),
          ),
          const Space(x: 10),
          _Tab(
            selected: selectedTab == SummarizerTab.summary,
            icon: IIcons.summary,
            onClick: () => onSelected(SummarizerTab.summary),
          ),
          const Space(x: 10),
          _Tab(
            selected: selectedTab == SummarizerTab.search,
            icon: IIcons.search,
            onClick: () => onSelected(SummarizerTab.search),
          ),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final bool selected;
  final Image icon;
  final void Function() onClick;

  const _Tab(
      {super.key,
      required this.selected,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Container(
          decoration: BoxDecoration(
              color: selected
                  ? const Color.fromARGB(255, 241, 245, 249)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: icon,
        ),
      ),
    );
  }
}
