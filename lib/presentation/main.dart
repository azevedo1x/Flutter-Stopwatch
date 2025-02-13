import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'stopwatch_provider.dart';
import 'stopwatch_service.dart';
import 'views/inicio_view.dart';
import 'views/sobre_view.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: InicioView(),
      ),
    ),
  );
}