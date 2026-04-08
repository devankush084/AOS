class OTPState {
  final bool isLoading;
  final String otp;
  final String? error;

  OTPState({
    this.isLoading = false,
    this.otp = '',
    this.error,
  });

  OTPState copyWith({
    bool? isLoading,
    String? otp,
    String? error,
  }) {
    return OTPState(
      isLoading: isLoading ?? this.isLoading,
      otp: otp ?? this.otp,
      error: error,
    );
  }
}