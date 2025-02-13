import 'package:flutter/material.dart';
import 'package:stopwatch/widgets/AnimatedStopwatch.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Center(
              child: AnimatedStopwatch(elapsed: Duration()),
            ),
            SizedBox(height: 20),
            Center(child: Text('Stopwatch', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
            SizedBox(height: 10),
            Center(child: Text('v 2.0', style: TextStyle(fontSize: 18))),
            SizedBox(height: 20),
            Center(child: Text('Developed by:', style: TextStyle(fontSize: 18))),
            Center(child: Text('github.com/azevedo1x', style: TextStyle(fontSize: 16))),
            SizedBox(height: 10),
            Center(child: Text('v1: 07/2023', style: TextStyle(fontSize: 16))),
            SizedBox(height: 10),
            Center(child: Text('v2: 02/2025', style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}