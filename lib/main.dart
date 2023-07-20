// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
        child: MaterialApp(
      home: Inicio(),
    )),
  );
}

final cronometroProvider = StateProvider((ref) => false);

class Inicio extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isOn = ref.watch(cronometroProvider);
    int tempo = 000000;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cronômetro Musical'),
      ),

      //me ajude a colocar o cronometro aqui
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage("timer.jpg"),
              width: 250,
              height: 250,
            ),
            Text(tempo.toString()),
            ElevatedButton(
                onPressed: () {
                  ref.read(cronometroProvider.notifier).state = !isOn;
                },
                child: Text('Iniciar/Pausar')),
          ],
        ),
      ),
    );
  }
}
