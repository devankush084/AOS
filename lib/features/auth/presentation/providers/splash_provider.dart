import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends StateNotifier<bool> {
  SplashController() : super(false);

  /// 🔥 Start animation
  void startAnimation() {
    state = true;
  }

  /// 🔥 CHECK FIRST TIME
  Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();

    final isFirst = prefs.getBool('isFirstTime') ?? true;

    if (isFirst) {
      await prefs.setBool('isFirstTime', false);
    }

    return isFirst;
  }
}

final splashProvider =
    StateNotifierProvider<SplashController, bool>((ref) => SplashController());

/// INIT
final splashInitProvider = Provider<void>((ref) {
  final controller = ref.read(splashProvider.notifier);

  Future.microtask(() {
    controller.startAnimation();
  });
});
