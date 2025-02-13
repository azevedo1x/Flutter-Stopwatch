import 'package:flutter_riverpod/flutter_riverpod.dart';

final stopwatchProvider = StateProvider((ref) => false);
final elapsedProvider = StateProvider((ref) => Duration.zero);