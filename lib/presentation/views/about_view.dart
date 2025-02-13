import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        leading: ElevatedButton(
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            Image(
              image: AssetImage("timer.jpg"),
              width: 250,
              height: 250,
            ),
            Text('Stopwatch'),
            Text('v 2.0'),
            Text('Developed by:'),
            Text('Gabriel da Silva Azevedo'),
            Text('07/2023'),
            Text('Refactory date: 02/2025')
          ],
        ),
      ),
    );
  }
}