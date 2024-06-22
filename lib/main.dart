import 'package:basketball_tracker/theme.dart';
import 'package:basketball_tracker/widgets/score_history_area.dart';
import 'package:basketball_tracker/widgets/team_score_area.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    // To install Riverpod, we need to add this widget above everything else.
    // This should not be inside "MyApp" but as direct parameter to "runApp".
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hooks Demo',
      theme: appTheme,
      home: const HomeWidget(),
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/images/basketball.png',
            height: 300,
          ),
          const IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TeamScoreArea(),
                VerticalDivider(
                  thickness: 2.0,
                ),
                TeamScoreArea(),
              ],
            ),
          ),
          const ScoreHistoryBody(),
        ],
      ),
    );
  }
}
