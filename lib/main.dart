import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
             Inicio())
      ),
      ),
    ),
  );
}

class Inicio extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ) {
    return body()

}
