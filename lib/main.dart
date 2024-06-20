import 'package:basketballtracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterState extends ChangeNotifier {
  int count = 0;

  updateCount() {
    count++;
    notifyListeners();
  }
}

class TeamOneState extends ChangeNotifier {
  int count = 0;
  addOnePoint() {
    count += 1;
    notifyListeners();
  }

  addTwoPoints() {
    count += 2;
    notifyListeners();
  }

  addThreePoints() {
    count += 3;
    notifyListeners();
  }
}

class TeamTwoState extends ChangeNotifier {
  int count = 0;
  addOnePoint() {
    count += 1;
    notifyListeners();
  }

  addTwoPoints() {
    count += 2;
    notifyListeners();
  }

  addThreePoints() {
    count += 3;
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

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            '${state.count} Points',
            style: const TextStyle(fontSize: 36),
          ),
          ElevatedButton(
            onPressed: () => {state.addOnePoint()},
            child: const Row(
              children: [
                Icon(Icons.add),
                Text('1 Point'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => {state.addTwoPoints()},
            child: const Row(
              children: [
                Icon(Icons.add),
                Text('2 Points'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => {state.addThreePoints()},
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

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            '${state.count} Points',
            style: const TextStyle(fontSize: 36),
          ),
          ElevatedButton(
            onPressed: () => {state.addOnePoint()},
            child: const Row(
              children: [
                Icon(Icons.add),
                Text('1 Point'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => {state.addTwoPoints()},
            child: const Row(
              children: [
                Icon(Icons.add),
                Text('2 Points'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => {state.addThreePoints()},
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
