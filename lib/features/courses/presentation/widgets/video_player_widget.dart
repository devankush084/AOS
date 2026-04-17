import 'package:aos/config/theme/color_scheme.dart';
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
    final controller = notifier.controller;

    if (controller == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

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
        child: SafeArea(
          child: Stack(
            children: [
              /// 🎥 VIDEO
              Positioned.fill(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: controller.value.size.width,
                      height: controller.value.size.height,
                      child: VideoPlayer(controller),
                    ),
                  ),
                ),
              ),

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
                          size: 70,
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

              /// 🔝 TOP RIGHT (Speed + Volume)
              if (state.showControls)
                Positioned(
                  top: 20,
                  right: 20,
                  child: Row(
                    children: [
                      PopupMenuButton<double>(
                        initialValue: state.speed,
                        onSelected: notifier.setSpeed,
                        itemBuilder: (context) => const [
                          PopupMenuItem(value: 0.5, child: Text("0.5x")),
                          PopupMenuItem(value: 1.0, child: Text("1x")),
                          PopupMenuItem(value: 1.5, child: Text("1.5x")),
                          PopupMenuItem(value: 2.0, child: Text("2x")),
                        ],
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.speed,
                                  size: 16, color: Colors.white),
                              const SizedBox(width: 4),
                              Text("${state.speed}x",
                                  style:
                                  const TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.volume_up,
                            color: Colors.white),
                        onPressed: notifier.toggleVolume,
                      ),
                    ],
                  ),
                ),

              /// ⬇️ BOTTOM CONTROLS
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(_formatDuration(state.position),
                            style: const TextStyle(color: Colors.white)),
                        Expanded(
                          child: Slider(
                            value: state.position.inSeconds
                                .clamp(0, state.duration.inSeconds)
                                .toDouble(),
                            max: state.duration.inSeconds == 0
                                ? 1
                                : state.duration.inSeconds.toDouble(),
                            activeColor: AppColors.appBarColor,
                            inactiveColor: Colors.grey,
                            onChanged: (v) => notifier.seekTo(
                              Duration(seconds: v.toInt()),
                            ),
                          ),
                        ),
                        Text(_formatDuration(state.duration),
                            style: const TextStyle(color: Colors.white)),
                        IconButton(
                          icon: const Icon(Icons.fullscreen_exit,
                              color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),

                    /// 🔊 Volume Slider
                    if (state.showVolume)
                      Row(
                        children: [
                          const Icon(Icons.volume_down,
                              color: Colors.white),
                          Expanded(
                            child: Slider(
                              value: state.volume,
                              min: 0,
                              max: 1,
                              activeColor: Colors.white,
                              onChanged: notifier.setVolume,
                            ),
                          ),
                          const Icon(Icons.volume_up,
                              color: Colors.white),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}