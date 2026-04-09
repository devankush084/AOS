import 'package:aos/features/dashboard/presentation/providers/dashboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final courseProvider =
StateNotifierProvider<CourseNotifier, CourseState>(
        (ref) => CourseNotifier());