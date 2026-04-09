import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/network_provider.dart';

class NetworkListener extends ConsumerWidget {
  final Widget child;

  const NetworkListener({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(networkProvider);

    return Stack(
      children: [
        child,

        if (!isConnected)
          Container(
            color: Colors.black.withOpacity(0.6),
            child: const Center(
              child: Text(
                "No Internet Connection",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
      ],
    );
  }
}