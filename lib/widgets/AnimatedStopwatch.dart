import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedStopwatch extends StatefulWidget {
  final Duration elapsed;

  const AnimatedStopwatch({super.key, required this.elapsed});

  @override
  State<AnimatedStopwatch> createState() => _AnimatedStopwatchState();
}

class _AnimatedStopwatchState extends State<AnimatedStopwatch> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: CustomPaint(
        painter: StopwatchPainter(widget.elapsed),
      ),
    );
  }
}

class StopwatchPainter extends CustomPainter {
  final Duration elapsed;

  StopwatchPainter(this.elapsed);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawCircle(center, radius, paint);

    final secondHand = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;

    final secondAngle = (elapsed.inSeconds % 60) * (2 * pi / 60);
    final secondEnd = Offset(
      center.dx + radius * 0.9 * cos(secondAngle - pi / 2),
      center.dy + radius * 0.9 * sin(secondAngle - pi / 2),
    );

    canvas.drawLine(center, secondEnd, secondHand);

    final minuteHand = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3;

    final minuteAngle = (elapsed.inMinutes % 60) * (2 * pi / 60);
    final minuteEnd = Offset(
      center.dx + radius * 0.7 * cos(minuteAngle - pi / 2),
      center.dy + radius * 0.7 * sin(minuteAngle - pi / 2),
    );

    canvas.drawLine(center, minuteEnd, minuteHand);

    final hourHand = Paint()
      ..color = Colors.green
      ..strokeWidth = 4;

    final hourAngle = (elapsed.inHours % 12) * (2 * pi / 12);
    final hourEnd = Offset(
      center.dx + radius * 0.5 * cos(hourAngle - pi / 2),
      center.dy + radius * 0.5 * sin(hourAngle - pi / 2),
    );

    canvas.drawLine(center, hourEnd, hourHand);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}