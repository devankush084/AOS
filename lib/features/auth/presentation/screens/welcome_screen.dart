import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    /// 🔥 Better tablet detection
    final isTablet = size.shortestSide >= 600;

    return Scaffold(
      body: Stack(
        children: [

          /// 🔥 Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6C63FF),
                  Color(0xFF7F7AFB),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child:
              Column(
                children: [

                  if (isTablet) const Spacer(flex: 2),

                  Image.asset(
                    isTablet
                        ? "assets/images/table_welcome.png"
                        : "assets/images/OnBoarding_Images/Welcome_logo.png",
                    height: isTablet
                        ? size.height * 0.35
                        : size.height * 0.68,
                  ),

                  Spacer(flex: isTablet ? 3 : 9),

                  /// 🔥 BUTTON
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 0 : 24,
                    ),
                    child: GestureDetector(
                      onTap: () { Navigator.pushNamed(context, AppNames.login); },
                      child: Container(
                        height: isTablet ? 70 : 55,
                        width: isTablet ? size.width * 0.4 : double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFFFFFF), Color(0xFFEAEAFF)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child:  Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xFF5F2EEA),
                              fontSize: isTablet ? 22 : 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(flex: 1),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}