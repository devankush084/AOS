import 'package:aos/features/ai/presentation/providers/image_model.dart';
import 'package:aos/features/ai/presentation/providers/image_pick_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imagePickerProvider =
StateNotifierProvider<ImagePickerNotifier, ImagePickerState>(
      (ref) => ImagePickerNotifier(),
);