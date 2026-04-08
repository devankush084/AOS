import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'forgot_password_state.dart';

final forgotPasswordProvider =
StateNotifierProvider<ForgotPasswordNotifier, ForgotPasswordState>((ref) {
  return ForgotPasswordNotifier();
});

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  ForgotPasswordNotifier() : super(ForgotPasswordState());

  /// 🔥 VALIDATION
  bool validate(String email) {
    String? error;

    if (email.isEmpty) {
      error = "Email is required";
    } else if (!email.contains("@")) {
      error = "Enter valid email";
    }

    state = state.copyWith(emailError: error);

    return error == null;
  }

  /// 🔥 SUBMIT
  Future<void> submit(String email) async {
    if (!validate(email)) return;

    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 2));

    state = state.copyWith(isLoading: false);

    print("Reset link sent to $email");
  }
}