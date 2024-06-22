import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:basketball_tracker/providers.dart';

class TeamScoreArea extends HookConsumerWidget {
  const TeamScoreArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var teamName = useState('');
    var score = useState(0);
    var scoreHistory = ref.watch(scoreHistoryProvider.notifier);

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: 150,
            child: TextField(
              onChanged: (value) {
                teamName.value = value;
              },
              decoration: const InputDecoration(
                labelText: 'Team Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Text(
            '${score.value} Points',
            style: const TextStyle(fontSize: 36),
          ),
          ElevatedButton(
            onPressed: () {
              score.value += 1;
              scoreHistory.addHistory(teamName.value, 1);
            },
            child: const Row(
              children: [
                Icon(Icons.add),
                Text('1 Point'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              score.value += 2;
              scoreHistory.addHistory(teamName.value, 2);
            },
            child: const Row(
              children: [
                Icon(Icons.add),
                Text('2 Points'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              score.value += 3;
              scoreHistory.addHistory(teamName.value, 3);
            },
            child: const Row(
              children: [
                Icon(Icons.add),
                Text('3 Points'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
