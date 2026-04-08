import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'otp_state.dart';

final otpProvider =
StateNotifierProvider<OTPNotifier, OTPState>((ref) {
  return OTPNotifier();
});

class OTPNotifier extends StateNotifier<OTPState> {
  OTPNotifier() : super(OTPState());

  void updateOTP(String value) {
    state = state.copyWith(otp: value, error: null);
  }

  bool validate() {
    if (state.otp.length < 4) {
      state = state.copyWith(error: "Enter complete OTP");
      return false;
    }
    return true;
  }

  Future<bool> verifyOTP() async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 2));

    if (state.otp.length == 6) {
      state = state.copyWith(isLoading: false);
      return true; // ✅ success
    } else {
      state = state.copyWith(
        isLoading: false,
        error: "Invalid OTP",
      );
      return false; // ❌ fail
    }
  }
}