import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/stopwatch_provider.dart';
import '../../domain/stopwatch_service.dart';
import 'about_view.dart';
import '../../widgets/AnimatedStopwatch.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.info),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutView()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AnimatedStopwatch(elapsed: elapsed),
            const SizedBox(height: 20),
            TimerDisplay(elapsed: elapsed),
            const Spacer(),
            Padding(
            padding: const EdgeInsets.only(bottom: 150.0),
            child: ButtonRow(
              isOn: isOn,
              onStartPause: () {
                ref.read(stopwatchProvider.notifier).state = !isOn;
                if (isOn) {
                  _stopwatchService.stopStopwatch();
                } else {
                  _stopwatchService.startStopwatch(ref); 
                }
              },
              onReset: isOn
                  ? () => _stopwatchService.stopStopwatch()
                  : () => _stopwatchService.resetStopwatch(ref),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerDisplay extends StatelessWidget {
  final Duration elapsed;

  const TimerDisplay({super.key, required this.elapsed});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${elapsed.inHours}:${elapsed.inMinutes % 60}:${elapsed.inSeconds % 60}.${elapsed.inMilliseconds % 1000}',
      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    );
  }
}

class ButtonRow extends StatelessWidget {
  final bool isOn;
  final VoidCallback onStartPause;
  final VoidCallback onReset;

  const ButtonRow({
    super.key,
    required this.isOn,
    required this.onStartPause,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onStartPause,
          child: Text(isOn ? 'Pause' : 'Start'),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: onReset,
          child: const Text('Restart'),
        ),
      ],
    );
  }
}