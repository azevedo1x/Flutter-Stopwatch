import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/stopwatch_provider.dart';
import '../../domain/stopwatch_service.dart';
import 'about_view.dart';

class HomeView extends ConsumerWidget {
  final StopwatchService _stopwatchService = StopwatchService();

  HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isOn = ref.watch(stopwatchProvider);
    final elapsed = ref.watch(elapsedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
        leading: ElevatedButton(
          child: const Icon(Icons.info),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutView()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Image(
              image: AssetImage("timer.jpg"),
              width: 250,
              height: 250,
            ),
            Text(
              '${elapsed.inHours}:${elapsed.inMinutes % 60}:${elapsed.inSeconds % 60}.${elapsed.inMilliseconds
              % 1000}',
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(stopwatchProvider.notifier).state = !isOn;
                if (isOn) {
                  _stopwatchService.startStopwatch(ref);
                } else {
                  _stopwatchService.stopStopwatch();
                }
              },
              child: Text(isOn ? 'Pause' : 'Start'),
            ),
            ElevatedButton(
              onPressed: () => _stopwatchService.resetStopwatch(ref),
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}