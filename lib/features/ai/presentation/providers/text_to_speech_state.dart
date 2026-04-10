// import 'package:aos/features/ai/presentation/providers/text_to_speech_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:speech_to_text/speech_to_text.dart';
//
// class SpeechController extends StateNotifier<SpeechState> {
//   final SpeechToText _speech;
//
//   SpeechController(this._speech) : super(const SpeechState()) {
//     _init();
//   }
//
//   Future<void> _init() async {
//     bool available = await _speech.initialize();
//     print("speech get");
//     state = state.copyWith(isAvailable: available);
//   }
//
//   Future<void> startListening() async {
//     if (!state.isAvailable) return;
//
//     state = state.copyWith(isListening: true);
//
//     await _speech.listen(
//       onResult: (result) {
//         state = state.copyWith(
//           recognizedText: result.recognizedWords,
//         );
//       },
//     );
//   }
//
//   Future<void> stopListening() async {
//     await _speech.stop();
//     state = state.copyWith(isListening: false);
//   }
// }