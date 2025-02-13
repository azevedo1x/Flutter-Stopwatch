import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/stopwatch_provider.dart';
import '../../domain/stopwatch_service.dart';
import 'views/home_view.dart';
import 'views/about_view.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: HomeView(),
      ),
    ),
  );
}