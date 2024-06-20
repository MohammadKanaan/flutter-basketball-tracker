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

class TeamOneScoreState extends ChangeNotifier {
  int count = 0;

  addPoints(int points) {
    count += points;
    notifyListeners();
  }
}

class TeamOneNameState extends ChangeNotifier {
  String name = "Team One";

  updateName(String name) {
    this.name = name;
    notifyListeners();
  }
}

class TeamTwoScoreState extends ChangeNotifier {
  int count = 0;

  addPoints(int points) {
    count += points;
    notifyListeners();
  }
}

class TeamTwoNameState extends ChangeNotifier {
  String name = "Team One";

  updateName(String name) {
    this.name = name;
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
          create: (context) => TeamOneScoreState(),
        ),
        ChangeNotifierProvider(
          create: (context) => TeamTwoScoreState(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScoreHistoryState(),
        ),
        ChangeNotifierProvider(
          create: (context) => TeamOneNameState(),
        ),
        ChangeNotifierProvider(
          create: (context) => TeamTwoNameState(),
        ),
      ],
      child: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
    var state = context.watch<TeamOneScoreState>();
    var teamOneNameState = context.watch<TeamOneNameState>();
    var teamOneName = teamOneNameState.name;
    var scoreHistoryState = context.watch<ScoreHistoryState>();
    TextEditingController myController = TextEditingController();
    myController.text = teamOneName;

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: 150,
            child: TextField(
              controller: myController,
              onSubmitted: (value) => {teamOneNameState.updateName(value)},
            ),
          ),
          Text(
            '${state.count} Points',
            style: const TextStyle(fontSize: 36),
          ),
          ElevatedButton(
            onPressed: () => {
              state.addPoints(1),
              scoreHistoryState.udpateHistory(teamOneName, 1)
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
              scoreHistoryState.udpateHistory(teamOneName, 2)
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
              scoreHistoryState.udpateHistory(teamOneName, 3)
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
    var state = context.watch<TeamTwoScoreState>();
    var teamTwoNameState = context.watch<TeamTwoNameState>();
    var teamTwoName = teamTwoNameState.name;
    var scoreHistoryState = context.watch<ScoreHistoryState>();
    TextEditingController myController = TextEditingController();
    myController.text = teamTwoName;

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            width: 150,
            child: TextField(
              controller: myController,
              onSubmitted: (value) => {teamTwoNameState.updateName(value)},
            ),
          ),
          Text(
            '${state.count} Points',
            style: const TextStyle(fontSize: 36),
          ),
          ElevatedButton(
            onPressed: () => {
              state.addPoints(1),
              scoreHistoryState.udpateHistory(teamTwoName, 1)
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
              scoreHistoryState.udpateHistory(teamTwoName, 2)
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
              scoreHistoryState.udpateHistory(teamTwoName, 3)
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
