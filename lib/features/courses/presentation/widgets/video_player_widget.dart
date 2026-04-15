import 'dart:math';
import 'package:aos/features/courses/presentation/providers/course_video_model.dart';
import 'package:aos/features/courses/presentation/providers/course_video_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPage extends ConsumerStatefulWidget {
  final VideoPlayerController controller;

  const FullScreenVideoPage({
    super.key,
    required this.controller,
  });

  @override
  ConsumerState<FullScreenVideoPage> createState() =>
      _FullScreenVideoPageState();
}

class _FullScreenVideoPageState
    extends ConsumerState<FullScreenVideoPage> {

  @override
  void initState() {
    super.initState();



    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
  @override
  void dispose() {
    /// 🔙 BACK TO PORTRAIT

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    super.dispose();
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    /// 🔥 Provider se state + notifier lo
    final state = ref.watch(videoProvider);
    final notifier = ref.read(videoProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: GestureDetector(
          onTap: notifier.toggleControls,

          /// ⏪⏩ DOUBLE TAP SEEK
          onDoubleTapDown: (details) {
            final w = MediaQuery.of(context).size.width;

            if (details.localPosition.dx < w / 2) {
              notifier.seekRelative(-5);
            } else {
              notifier.seekRelative(5);
            }
          },

          child: Stack(
            children: [

              /// 🎥 VIDEO (ONLY ROTATED)
              Center(
                child: controller.value.isInitialized
                    ? AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    )
                    : const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),

              /// 🔲 OVERLAY
              if (state.showControls)
                Positioned.fill(
                  child: Container(color: Colors.black.withOpacity(0.3)),
                ),

              /// 🔝 TOP CONTROLS
              if (state.showControls)
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        /// 🔙 EXIT
                        IconButton(
                          icon: const Icon(Icons.fullscreen_exit,
                              color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),

                        Row(
                          children: [

                            /// SPEED
                            PopupMenuButton<double>(
                              initialValue: state.speed,
                              onSelected: notifier.setSpeed,
                              itemBuilder: (context) => const [
                                PopupMenuItem(value: 0.5, child: Text("0.5x")),
                                PopupMenuItem(value: 1.0, child: Text("1x")),
                                PopupMenuItem(value: 1.5, child: Text("1.5x")),
                                PopupMenuItem(value: 2.0, child: Text("2x")),
                              ],
                              child: const Icon(Icons.speed,
                                  color: Colors.white),
                            ),

                            const SizedBox(width: 10),

                            /// VOLUME
                            IconButton(
                              icon: const Icon(Icons.volume_up,
                                  color: Colors.white),
                              onPressed: notifier.toggleVolume,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              /// 🎯 CENTER CONTROLS
              if (state.showControls)
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.replay_5,
                            color: Colors.white, size: 40),
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
                        icon: const Icon(Icons.forward_5,
                            color: Colors.white, size: 40),
                        onPressed: () => notifier.seekRelative(5),
                      ),
                    ],
                  ),
                ),

              /// 📊 BOTTOM CONTROLS
              if (state.showControls)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Row(
                            children: [
                              Text(
                                _formatDuration(state.position),
                                style:
                                const TextStyle(color: Colors.white),
                              ),

                              Expanded(
                                child: Slider(
                                  value: state.position.inSeconds
                                      .clamp(0,
                                      state.duration.inSeconds)
                                      .toDouble(),
                                  max: state.duration.inSeconds == 0
                                      ? 1
                                      : state.duration.inSeconds
                                      .toDouble(),
                                  onChanged: (v) => notifier.seekTo(
                                    Duration(seconds: v.toInt()),
                                  ),
                                ),
                              ),

                              Text(
                                _formatDuration(state.duration),
                                style:
                                const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),

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
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}