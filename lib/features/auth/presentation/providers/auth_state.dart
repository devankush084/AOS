class AuthState {
  final bool isLoading;
  final String? emailError;
  final String? passwordError;
  final bool obscurePassword;

  AuthState({
    this.isLoading = false,
    this.emailError,
    this.passwordError,
    this.obscurePassword = true,
  });

  AuthState copyWith({
    bool? isLoading,
    String? emailError,
    String? passwordError,
    bool? obscurePassword,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      emailError: emailError,
      passwordError: passwordError,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }
}