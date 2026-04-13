import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/features/ai/presentation/providers/text_to_speech_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpeechDialog extends ConsumerWidget {
  const SpeechDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speech = ref.watch(speechProvider);

    ref.listen(speechProvider, (previous, next) {
      if (previous?.isListening == true && next.isListening == false) {
        Navigator.pop(context);
      }
    });


    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [AppColors.white, AppColors.backgroundColor],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: speech.isListening ? 100 : 70,
              width: speech.isListening ? 100 : 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: speech.isListening ? Colors.red : Colors.grey,
              ),
              child: const Icon(Icons.mic, color: Colors.white, size: 40),
            ),

            const SizedBox(height: 20),

            Text(
              speech.recognizedText.isEmpty
                  ? "Listening..."
                  : speech.recognizedText,
              style: const TextStyle(color: AppColors.fontColor, fontSize: 18),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Stop"),
            ),
          ],
        ),
      ),
    );
  }
}
