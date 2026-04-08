import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'reset_password_state.dart';

final resetPasswordProvider =
StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>(
        (ref) => ResetPasswordNotifier());

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  ResetPasswordNotifier() : super(ResetPasswordState());

  void togglePassword() {
    state = state.copyWith(
      obscurePassword: !state.obscurePassword,
    );
  }

  void toggleConfirm() {
    state = state.copyWith(
      obscureConfirm: !state.obscureConfirm,
    );
  }

  void validate(String password, String confirm) {
    String? passError;
    String? confirmError;

    if (password.length < 6) {
      passError = "Password must be at least 6 characters";
    }

    if (confirm != password) {
      confirmError = "Passwords do not match";
    }

    state = state.copyWith(
      passwordError: passError,
      confirmPasswordError: confirmError,
    );
  }

  Future<void> submit(String password, String confirm) async {
    validate(password, confirm);

    if (state.passwordError != null ||
        state.confirmPasswordError != null) {
      return;
    }

    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 2));

    state = state.copyWith(isLoading: false);
  }
}