import 'package:aos/features/courses/presentation/providers/course_video_model.dart';
import 'package:aos/features/courses/presentation/providers/course_video_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final videoProvider =
StateNotifierProvider<VideoControllerNotifier, VideoState>(
      (ref) => VideoControllerNotifier(),
);