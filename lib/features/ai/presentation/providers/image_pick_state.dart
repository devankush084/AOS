import 'dart:io';
import 'package:aos/features/ai/presentation/providers/image_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerNotifier extends StateNotifier<ImagePickerState> {
  ImagePickerNotifier() : super(const ImagePickerState());

  final ImagePicker _picker = ImagePicker();

  Future<void> pickFromGallery() async {
    try {
      state = state.copyWith(isLoading: true);

      final List<XFile> pickedFiles = await _picker.pickMultiImage();

      if (pickedFiles.isNotEmpty) {
        final files = pickedFiles.map((e) => File(e.path)).toList();

        state = state.copyWith(
          images: [...state.images, ...files],
          isLoading: false,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
  void removeImage(int index) {
    final updated = [...state.images]..removeAt(index);
    state = state.copyWith(images: updated);
  }
  void clearImages() {
    state = state.copyWith(images: []);
  }



}