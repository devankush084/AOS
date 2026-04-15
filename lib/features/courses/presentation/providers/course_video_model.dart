class VideoState {
  final bool isInitialized;
  final bool isPlaying;
  final bool showControls;
  final bool showVolume;
  final bool isFullscreen;
  final Duration position;
  final Duration duration;
  final double volume;
  final double speed;

  const VideoState({
    this.isInitialized = false,
    this.isPlaying = false,
    this.showControls = true,
    this.showVolume = false,
    this.isFullscreen = false,
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.volume = 1.0,
    this.speed = 1.0,

  });

  VideoState copyWith({
    bool? isInitialized,
    bool? isPlaying,
    bool? showControls,
    bool? showVolume,
    bool? isFullscreen,
    Duration? position,
    Duration? duration,
    double? volume,
    double? speed,
  }) {
    return VideoState(
      isInitialized: isInitialized ?? this.isInitialized,
      isPlaying: isPlaying ?? this.isPlaying,
      showControls: showControls ?? this.showControls,
      showVolume: showVolume ?? this.showVolume,
      isFullscreen: isFullscreen ?? this.isFullscreen,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      volume: volume ?? this.volume,
      speed: speed ?? this.speed,
    );
  }
}