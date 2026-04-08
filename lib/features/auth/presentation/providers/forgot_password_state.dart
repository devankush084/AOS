class ForgotPasswordState {
  final bool isLoading;
  final String? emailError;

  ForgotPasswordState({
    this.isLoading = false,
    this.emailError,
  });

  ForgotPasswordState copyWith({
    bool? isLoading,
    String? emailError,
  }) {
    return ForgotPasswordState(
      isLoading: isLoading ?? this.isLoading,
      emailError: emailError,
    );
  }
}