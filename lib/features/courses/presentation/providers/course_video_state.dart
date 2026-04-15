import 'dart:async';

import 'package:aos/features/courses/presentation/providers/course_video_model.dart';
import 'package:aos/features/courses/presentation/widgets/video_player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoControllerNotifier extends StateNotifier<VideoState> {
  VideoControllerNotifier() : super(const VideoState());

  VideoPlayerController? controller;
  Timer? _hideTimer;

  /// INIT
  Future<void> init(String path) async {
    controller = VideoPlayerController.asset(path);

    await controller!.initialize();
    await controller!.play();

    /// 🔥 APPLY LAST SPEED
    await controller!.setPlaybackSpeed(state.speed);

    state = state.copyWith(
      isInitialized: true,
      duration: controller!.value.duration,
      showControls: false,
      isPlaying: true,

    );

    controller!.addListener(_listener);

    _startHideTimer();
  }

  void _listener() {
    if (controller == null) return;

    state = state.copyWith(
      position: controller!.value.position,
      isPlaying: controller!.value.isPlaying,
    );
  }

  /// PLAY / PAUSE
  void togglePlay() {
    if (controller!.value.isPlaying) {
      controller!.pause();
    } else {
      controller!.play();
    }

    _startHideTimer(); // 👈 interaction → reset timer
  }

  /// SEEK
  void seekTo(Duration d) {
    controller!.seekTo(d);
    _startHideTimer();
  }

  void seekRelative(int sec) {
    final pos = controller!.value.position;
    final duration = controller!.value.duration;

    final newPosition = pos + Duration(seconds: sec);

    final safePosition = newPosition < Duration.zero
        ? Duration.zero
        : newPosition > duration
        ? duration
        : newPosition;

    controller!.seekTo(safePosition);

    _startHideTimer();
  }

  /// VOLUME
  void setVolume(double v) {
    controller!.setVolume(v);
    state = state.copyWith(volume: v);
    _startHideTimer();
  }

  void toggleVolume() {
    state = state.copyWith(showVolume: !state.showVolume);
    _startHideTimer();
  }

  /// 🎯 CONTROLS SHOW/HIDE (TAP)
  void toggleControls() {
    final newValue = !state.showControls;

    state = state.copyWith(showControls: newValue);

    if (newValue) {
      _startHideTimer(); // 👈 show → auto hide start
    } else {
      _hideTimer?.cancel();
    }
  }

  /// ⏱ AUTO HIDE TIMER
  void _startHideTimer() {
    _hideTimer?.cancel();

    _hideTimer = Timer(const Duration(seconds: 3), () {
      state = state.copyWith(showControls: false);
    });
  }

  /// 🚀 SPEED CONTROL
  void setSpeed(double speed) async {
    if (controller == null) return;

    final wasPlaying = controller!.value.isPlaying;

    await controller!.setPlaybackSpeed(speed);

    if (wasPlaying) {
      controller!.play();
    }

    state = state.copyWith(speed: speed);

    _startHideTimer();
  }

  /// FULLSCREEN
  void toggleFullscreen() {
    if (controller == null || !controller!.value.isInitialized) return;

    final isNowFullscreen = !state.isFullscreen;

    state = state.copyWith(isFullscreen: isNowFullscreen);

    /// 🔥 Optional: immersive mode (hide status bar)
    if (isNowFullscreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }

    _startHideTimer();
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    controller?.dispose();

    /// reset orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    super.dispose();
  }
}