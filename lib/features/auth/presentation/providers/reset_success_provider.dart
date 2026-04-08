import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'reset_success_state.dart';

final resetSuccessProvider =
StateNotifierProvider<ResetSuccessNotifier, ResetSuccessState>(
        (ref) => ResetSuccessNotifier());

class ResetSuccessNotifier extends StateNotifier<ResetSuccessState> {
  ResetSuccessNotifier() : super(ResetSuccessState());

  void startAutoRedirect() async {
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(autoRedirect: true);
  }
}