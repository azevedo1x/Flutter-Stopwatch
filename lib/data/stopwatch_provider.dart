import 'package:flutter_riverpod/flutter_riverpod.dart';

final stopwatchProvider = StateProvider((ref) => true);
final elapsedProvider = StateProvider((ref) => Duration.zero);