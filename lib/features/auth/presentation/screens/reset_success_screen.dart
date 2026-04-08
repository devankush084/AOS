import 'package:aos/Core/constants/app_images.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/reset_success_provider.dart';

class ResetSuccessScreen extends ConsumerWidget {
  const ResetSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    ref.listen(resetSuccessProvider, (prev, next) {
      if (next.autoRedirect && context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppNames.login,
              (route) => false,
        );
      }
    });

    /// 🔥 Start timer once
    ref.read(resetSuccessProvider.notifier).startAutoRedirect();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 80 : 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /// 🔥 IMAGE
                Image.asset(
                  AppImages.resetsucess,
                  height: isTablet ? 260 : 200,
                ),

                SizedBox(height: isTablet ? 40 : 30),

                /// 🔥 TITLE
                Text(
                  "Password Reset\nSuccessful",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isTablet ? 26 : 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: isTablet ? 20 : 12),

                /// 🔥 DESC
                Text(
                  "Your password has been reset successfully.\nYou can now log in using your new password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),

                SizedBox(height: isTablet ? 40 : 30),

                /// 🔥 BUTTON
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppNames.login,
                          (route) => false,
                    );
                  },
                  child: Container(
                    height: isTablet ? 60 : 55,
                    width: isTablet ? size.width * 0.4 : double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF5F2EEA),
                          Color(0xFF7B61FF),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Back to Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}