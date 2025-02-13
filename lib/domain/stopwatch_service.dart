import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StopwatchService {
  final Stopwatch _stopwatch = Stopwatch();

  void startStopwatch(WidgetRef ref) {
    _stopwatch.start();
    _updateElapsedTime(ref);
  }

  void stopStopwatch() {
    _stopwatch.stop();
  }

  void resetStopwatch(WidgetRef ref) {
    _stopwatch.reset();
    ref.read(elapsedProvider.notifier).state = Duration.zero;
  }

  void _updateElapsedTime(WidgetRef ref) {
    ref.read(elapsedProvider.notifier).state = _stopwatch.elapsed;
    Timer(const Duration(milliseconds: 1), () => _updateElapsedTime(ref));
  }
}