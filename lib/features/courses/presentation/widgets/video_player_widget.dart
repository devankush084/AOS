import 'package:aos/features/courses/presentation/providers/course_video_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPage extends ConsumerWidget {
  const FullScreenVideoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(videoProvider);
    final notifier = ref.read(videoProvider.notifier);
    final controller = notifier.controller!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: notifier.toggleControls,

        onDoubleTapDown: (details) {
          final w = MediaQuery.of(context).size.width;
          if (details.localPosition.dx < w / 2) {
            notifier.seekRelative(-5);
          } else {
            notifier.seekRelative(5);
          }
        },

        child: Center(
          child: RotatedBox(
            quarterTurns: 1,
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(
                children: [

                  /// 🎥 VIDEO
                  Positioned.fill(child: VideoPlayer(controller)),

                  /// 🔲 OVERLAY
                  if (state.showControls)
                    Container(color: Colors.black.withOpacity(0.3)),

                  /// 🎯 CENTER CONTROLS
                  if (state.showControls)
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.replay_5,
                                color: Colors.white.withOpacity(0.8), size: 40),
                            onPressed: () => notifier.seekRelative(-5),
                          ),
                          IconButton(
                            icon: Icon(
                              state.isPlaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle,
                              color: Colors.white,
                              size: 60,
                            ),
                            onPressed: notifier.togglePlay,
                          ),
                          IconButton(
                            icon: Icon(Icons.forward_5,
                                color: Colors.white.withOpacity(0.8), size: 40),
                            onPressed: () => notifier.seekRelative(5),
                          ),
                        ],
                      ),
                    ),

                  /// ⬇️ BOTTOM CONTROLS
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.fullscreen_exit,
                              color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}