import 'package:flutter_riverpod/flutter_riverpod.dart';


enum CourseStatus { initial, loading, completed }

class CourseState {
  final double progress;
  final CourseStatus status;

  CourseState({
    required this.progress,
    required this.status,
  });

  CourseState copyWith({
    double? progress,
    CourseStatus? status,
  }) {
    return CourseState(
      progress: progress ?? this.progress,
      status: status ?? this.status,
    );
  }
}

class CourseNotifier extends StateNotifier<CourseState> {
  CourseNotifier()
      : super(CourseState(
    progress: 0.8,
    status: CourseStatus.initial,
  ));

  Future<void> updateProgress() async {




    double newProgress = state.progress + 0.1;

    if (newProgress >= 1.0) {
      state = state.copyWith(
        progress: 1.0,
        status: CourseStatus.completed,
      );
    } else {
      state = state.copyWith(
        progress: newProgress,
        status: CourseStatus.initial,
      );
    }
  }
}

