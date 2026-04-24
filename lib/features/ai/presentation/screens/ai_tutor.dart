import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'ai_chat_screen.dart';

class AiTutorScreen extends StatefulWidget {
  const AiTutorScreen({super.key});

  @override
  State<AiTutorScreen> createState() => _AiTutorScreenState();
}

class _AiTutorScreenState extends State<AiTutorScreen> {
  double progress = 0.0;
  bool isLoading = false;

  /// 🔥 START LOADING FUNCTION
  void startLoading() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 35));
      if (!mounted) return;

      setState(() {
        progress = i / 100;
      });
    }

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const AiChatScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.appBarColor,
              AppColors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 110.h),

                /// 🔥 TITLE
                Text(
                  "Your AI Learning Buddy",
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8.h),

                /// 🔥 SUBTITLE
                Text(
                  "Smart. Adaptive. Always here to help.",
                  style: TextStyle(color: Colors.white60),
                ),

                /// 🔥 LOTTIE ANIMATION
                Expanded(
                  child: Center(
                    child: Lottie.asset(
                      'assets/anim/ai_chatbot.json',
                      height: 0.5.sh,
                    ),
                  ),
                ),

                /// 🔥 BOTTOM SECTION
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// 🔥 PREMIUM BUTTON
                      GestureDetector(
                        onTap: () {
                          if (isLoading) return;

                          setState(() {
                            isLoading = true;
                          });

                          startLoading();
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF6C63FF),
                                Color(0xFF8E7BFF),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.deepPurple.withOpacity(0.4),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (isLoading)
                                const SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              else
                                const Icon(Icons.auto_awesome,
                                    color: Colors.white),

                              SizedBox(width: 10.w),

                              Text(
                                isLoading ? "Starting..." : "Start AI Chat",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      /// 🔥 LOADING TEXT
                      Text(
                        "Preparing your personalized learning experience...",
                        style: const TextStyle(color: Colors.black),
                      ),

                      SizedBox(height: 8.h),

                      /// 🔥 PROGRESS BAR
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 8,
                          backgroundColor: Colors.grey.shade300,
                          valueColor: const AlwaysStoppedAnimation(
                            Color(0xFF6C63FF),
                          ),
                        ),
                      ),

                      SizedBox(height: 6.h),

                      /// 🔥 PERCENT TEXT
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "${(progress * 100).toInt()}%",
                          style: const TextStyle(
                            color: Color(0xff3E51D0FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 20.h,
                      ),
                    ],
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