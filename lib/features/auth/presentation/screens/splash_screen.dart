import 'package:aos/Core/utils/app_sizes.dart';
import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:aos/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/splash_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(splashInitProvider);
    final animate = ref.watch(splashProvider);

    final isTab = MediaQuery.of(context).size.shortestSide >= 600;

    ref.listen<bool>(splashProvider, (prev, next) async {
      if (next == true) {
        await Future.delayed(const Duration(seconds: 2));

        final controller = ref.read(splashProvider.notifier);
        final isFirst = await controller.isFirstTime();

        if (!context.mounted) return;

        if (isFirst) {
          Navigator.pushReplacementNamed(context, AppNames.onboarding);
        } else {
          Navigator.pushReplacementNamed(context, AppNames.welcome);
        }
      }
    });

    return Scaffold(
      body: Stack(
        children: [

          /// ❌ Hide on Tablet
          if (!isTab)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.splashUpper,
                height: AppSizes.topImage(context),
                fit: BoxFit.cover,
              ),
            ),

          /// ❌ Hide on Tablet
          if (!isTab)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.splashLower,
                height: AppSizes.bottomImage(context),
                fit: BoxFit.cover,
              ),
            ),

          /// ✅ Center Logo (Always visible)
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1200),
              opacity: animate ? 1 : 0,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 1200),
                scale: animate ? 1 : 0.7,
                curve: Curves.easeOutBack,
                child: Image.asset(
                  AppImages.splashBanner,
                  height: isTab
                      ? MediaQuery.of(context).size.height * 0.95
                      : AppSizes.splashImage(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
