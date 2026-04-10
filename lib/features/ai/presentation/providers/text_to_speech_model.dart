class SpeechState {
  final bool isListening;
  final String recognizedText;
  final bool isAvailable;

  const SpeechState({
    this.isListening = false,
    this.recognizedText = '',
    this.isAvailable = false,
  });

  SpeechState copyWith({
    bool? isListening,
    String? recognizedText,
    bool? isAvailable,
  }) {
    return SpeechState(
      isListening: isListening ?? this.isListening,
      recognizedText: recognizedText ?? this.recognizedText,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}