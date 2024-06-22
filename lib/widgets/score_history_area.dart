import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:basketball_tracker/providers.dart';

class ScoreHistoryBody extends ConsumerWidget {
  const ScoreHistoryBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> scoreHistory = ref.watch(scoreHistoryProvider);
    final ScrollController scrollController = ScrollController();

    return Expanded(
      child: Stack(children: [
        Scrollbar(
          thumbVisibility: true,
          child: ListView.builder(
            controller: scrollController,
            reverse: true,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: scoreHistory.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Time stamp: $index'),
                subtitle: Text(scoreHistory[index]),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          // scroll to top button
          child: FloatingActionButton(
            onPressed: () => scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn),
            child: const Icon(Icons.arrow_upward),
          ),
        )
      ]),
    );
  }
}
