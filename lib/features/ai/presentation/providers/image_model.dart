import 'dart:io';

class ImagePickerState {
 final List<File> images;
  final bool isLoading;
  final String? error;

  const ImagePickerState({
    this.images = const[],
    this.isLoading = false,
    this.error,
  });

  ImagePickerState copyWith({
    List<File>? images,
    bool? isLoading,
    String? error,
  }) {
    return ImagePickerState(
      images: images ?? this.images,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}