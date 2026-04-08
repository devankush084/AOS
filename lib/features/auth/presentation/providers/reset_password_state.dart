class ResetPasswordState {
  final String? passwordError;
  final String? confirmPasswordError;
  final bool isLoading;
  final bool obscurePassword;
  final bool obscureConfirm;

  ResetPasswordState({
    this.passwordError,
    this.confirmPasswordError,
    this.isLoading = false,
    this.obscurePassword = true,
    this.obscureConfirm = true,
  });

  ResetPasswordState copyWith({
    String? passwordError,
    String? confirmPasswordError,
    bool? isLoading,
    bool? obscurePassword,
    bool? obscureConfirm,
  }) {
    return ResetPasswordState(
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
      isLoading: isLoading ?? this.isLoading,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirm: obscureConfirm ?? this.obscureConfirm,
    );
  }
}