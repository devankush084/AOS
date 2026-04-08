import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 🔥 CONTROLLER
class OnboardingController extends StateNotifier<int> {
  OnboardingController() : super(0);

  void setIndex(int index) {
    state = index;
  }

  void next(int total, void Function() onFinish) {
    if (state == total - 1) {
      onFinish();
    } else {
      state++;
    }
  }
}

/// 🔥 PROVIDER
final onboardingProvider =
StateNotifierProvider<OnboardingController, int>(
        (ref) => OnboardingController());