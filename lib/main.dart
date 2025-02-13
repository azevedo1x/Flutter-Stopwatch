// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: Home(),
      ),
    ),
  );
}

final stopwatchProvider = StateProvider((ref) => true);
final elapsedProvider = StateProvider((ref) => Duration.zero);

class Home extends ConsumerWidget {
  Stopwatch stopwatch = Stopwatch();
  Duration elapsed = Duration.zero;

  void stopwatchAction(WidgetRef ref) {
    ref.read(elapsedProvider.notifier).state = stopwatch.elapsed;
    Timer(const Duration(milliseconds: 1), () => stopwatchAction(ref));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isOn = ref.watch(stopwatchProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
        leading: ElevatedButton(
          child: Icon(Icons.info),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => About()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage("timer.jpg"),
              width: 250,
              height: 250,
            ),
            Consumer(
              builder: (context, ref, _) {
                final elapsed = ref.watch(elapsedProvider);
                return Text(elapsed.toString());
              },
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(stopwatchProvider.notifier).state = !isOn;

                  if (isOn == true) {
                    stopwatch.start();
                    stopwatchAction(ref);
                  } else {
                    stopwatch.stop();
                  }
                },
                child: Text('Start/Pause')),
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        leading: ElevatedButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage("timer.jpg"),
              width: 250,
              height: 250,
            ),
            Text('Stopwatch'),
            Text('Version 1.1'),
            Text('Developed by:'),
            Text('Gabriel da Silva Azevedo'),
            Text('07/2023'),
          ],
        ),
      ),
    );
  }
}
