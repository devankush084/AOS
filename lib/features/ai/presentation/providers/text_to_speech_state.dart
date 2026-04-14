import 'dart:async';
import 'package:aos/features/ai/presentation/providers/text_to_speech_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechController extends StateNotifier<SpeechState> {
  final SpeechToText _speech;

  SpeechController(this._speech) : super(const SpeechState()) {
    _init();
  }

  Future<void> _init() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        print("STATUS: $status");
        if (status == "done" || status == "notListening") {
          state = state.copyWith(isListening: false);
        }
      },
    );

    state = state.copyWith(isAvailable: available);
  }

  Future<void> toggleListening() async {
    if (!state.isAvailable) return;
    if (state.isListening) {
      await stopListening();
    } else {
      await startListening();
    }
  }

  Timer? _silenceTimer;

  Future<void> startListening() async {
    if (!state.isAvailable || state.isListening) return;
    state = state.copyWith(
      isListening: true,
      recognizedText: '',
    );
    await _speech.listen(
      listenFor: const Duration(seconds: 30),
      pauseFor: const Duration(seconds: 5),
      partialResults: true,
      listenMode: ListenMode.dictation,
      onResult: (result) {
        state = state.copyWith(
          recognizedText: result.recognizedWords,
        );
        _resetSilenceTimer();
      },
    );
    _resetSilenceTimer();
  }

  Future<void> stopListening() async {
    await _speech.stop();
    _silenceTimer?.cancel();
    state = state.copyWith(isListening: false);
  }

  void _resetSilenceTimer() {
    _silenceTimer?.cancel();
    _silenceTimer = Timer(const Duration(seconds: 3), () {
      print("NO SPEECH → AUTO STOP");
      stopListening();
    });
  }

  void clear() {
    state = state.copyWith(recognizedText: '');
  }
}
