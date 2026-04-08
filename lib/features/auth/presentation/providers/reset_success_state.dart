class ResetSuccessState {
  final bool autoRedirect;

  ResetSuccessState({this.autoRedirect = false});

  ResetSuccessState copyWith({bool? autoRedirect}) {
    return ResetSuccessState(
      autoRedirect: autoRedirect ?? this.autoRedirect,
    );
  }
}