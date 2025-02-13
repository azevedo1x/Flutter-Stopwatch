import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
        leading: ElevatedButton(
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: const AssetImage("timer.jpg"),
              width: 250,
              height: 250,
            ),
            const Text('Cronômetro'),
            const Text('Versão 1.0'),
            const Text('Desenvolvido por:'),
            const Text('Gabriel da Silva Azevedo'),
            const Text('07/2023'),
          ],
        ),
      ),
    );
  }
}