import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

final networkProvider =
StateNotifierProvider<NetworkNotifier, bool>((ref) {
  return NetworkNotifier();
});

class NetworkNotifier extends StateNotifier<bool> {
  late StreamSubscription _subscription;

  NetworkNotifier() : super(true) {
    _init();
  }

  void _init() {
    _subscription =
        Connectivity().onConnectivityChanged.listen((result) {
          state = result != ConnectivityResult.none;
        });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}