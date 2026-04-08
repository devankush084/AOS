import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_state.dart';

final authProvider =
StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  /// 🔥 VALIDATION
  bool validate(String email, String password) {
    String? emailError;
    String? passwordError;

    if (email.isEmpty) {
      emailError = "Life ID is required";
    } else if (email.length < 4) {
      emailError = "Invalid Life ID";
    }

    if (password.isEmpty) {
      passwordError = "Password required";
    } else if (password.length < 6) {
      passwordError = "Min 6 characters";
    }

    state = state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
    );

    return emailError == null && passwordError == null;
  }

  /// 🔥 LOGIN (USECASE CONNECT LATER)
  Future<void> login(String email, String password) async {
    if (!validate(email, password)) return;

    state = state.copyWith(isLoading: true);

    try {
      await Future.delayed(const Duration(seconds: 2));

      /// 👉 Later replace with:
      /// ref.read(loginUseCase).call()

      state = state.copyWith(isLoading: false);

      print("✅ Login Success");
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print("❌ Login Failed");
    }
  }

  /// 🔥 PASSWORD TOGGLE
  void togglePassword() {
    state = state.copyWith(
      obscurePassword: !state.obscurePassword,
    );
  }
}