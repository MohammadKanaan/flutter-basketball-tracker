import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScoreHistoryNotifier extends StateNotifier<List<String>> {
  // We initialize the list of todos to an empty list
  ScoreHistoryNotifier() : super([]);

  void addHistory(String teamName, int points) {
    String entry = '$teamName scored $points';
    state = [...state, entry];
  }
}

final scoreHistoryProvider =
    StateNotifierProvider<ScoreHistoryNotifier, List<String>>((ref) {
  return ScoreHistoryNotifier();
});
