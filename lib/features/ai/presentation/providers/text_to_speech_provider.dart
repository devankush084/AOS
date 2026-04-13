import 'package:aos/features/ai/presentation/providers/text_to_speech_model.dart';
import 'package:aos/features/ai/presentation/providers/text_to_speech_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

final speechProvider =
StateNotifierProvider<SpeechController, SpeechState>((ref) {
  return SpeechController(SpeechToText());
});