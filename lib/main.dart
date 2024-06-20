import 'package:basketballtracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreHistoryState extends ChangeNotifier {
  List<String> history = [];

  udpateHistory(String teamName, int pointsScored) {
    history.add('$teamName scored $pointsScored points');
    notifyListeners();
  }
}

class TeamOneState extends ChangeNotifier {
  int count = 0;

  addPoints(int points) {
    count += points;
    notifyListeners();
  }
}

class TeamTwoState extends ChangeNotifier {
  int count = 0;

  addPoints(int points) {
    count += points;
    notifyListeners();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: const AppContext(),
    );
  }
}

class AppContext extends StatelessWidget {
  const AppContext({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TeamOneState(),
        ),
        ChangeNotifierProvider(
          create: (context) => TeamTwoState(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScoreHistoryState(),
        )
      ],
      child: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<ScoreHistoryState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basketball Tracker'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/basketball.png',
            height: 300,
          ),
          const IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TeamOneBody(),
                VerticalDivider(
                  thickness: 2.0,
                ),
                TeamTwoBody(),
              ],
            ),
          ),
          const ScoreHistoryBody(),
        ],
      ),
    );
  }
}

class TeamOneBody extends StatelessWidget {
  const TeamOneBody({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<TeamOneState>();
    var scoreHistoryState = context.watch<ScoreHistoryState>();

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            '${state.count} Points',
            style: const TextStyle(fontSize: 36),
          ),
          ElevatedButton(
            onPressed: () => {
              state.addPoints(1),
              scoreHistoryState.udpateHistory("Team One", 1)
            },
            child: const Row(
              children: [
                Icon(Icons.add),
                Text('1 Point'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              state.addPoints(2),
              scoreHistoryState.udpateHistory("Team One", 2)
            },
            child: const Row(
              children: [
                Icon(Icons.add),
                Text('2 Points'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              state.addPoints(3),
              scoreHistoryState.udpateHistory("Team One", 3)
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

class TeamTwoBody extends StatelessWidget {
  const TeamTwoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<TeamTwoState>();
    var scoreHistoryState = context.watch<ScoreHistoryState>();

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            '${state.count} Points',
            style: const TextStyle(fontSize: 36),
          ),
          ElevatedButton(
            onPressed: () => {
              state.addPoints(1),
              scoreHistoryState.udpateHistory("Team Two", 1)
            },
            child: const Row(
              children: [
                Icon(Icons.add),
                Text('1 Point'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              state.addPoints(2),
              scoreHistoryState.udpateHistory("Team Two", 2)
            },
            child: const Row(
              children: [
                Icon(Icons.add),
                Text('2 Points'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              state.addPoints(3),
              scoreHistoryState.udpateHistory("Team Two", 3)
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

class ScoreHistoryBody extends StatelessWidget {
  const ScoreHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<ScoreHistoryState>();
    var history = state.history;

    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
          reverse: true,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: history.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Time stamp: $index'),
              subtitle: Text(history[index]),
            );
          },
        ),
      ),
    );
  }
}
