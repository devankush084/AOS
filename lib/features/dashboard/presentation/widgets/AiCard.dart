import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiCard extends StatelessWidget {
  final VoidCallback onTap;

  const AiCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        /// 🔥 MAIN CARD
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.w),
          margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 10.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF5A41F5),
                Color(0xFF7B61FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 25,
                offset: Offset(0, 12),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Row(
                children: [
                  /// 🔥 TEXT SECTION
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ask Yana AI",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        Text(
                          "Get help with lessons,\nstudy & guidance instantly",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13.sp,
                          ),
                        ),

                        SizedBox(height: 14.h),

                        /// 🔥 BUTTON
                        GestureDetector(
                          onTap: onTap,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.auto_awesome,
                                    color: Color(0xFF5A41F5), size: 16.sp),
                                SizedBox(width: 6.w),
                                Text(
                                  "Ask AI",
                                  style: TextStyle(
                                    color: Color(0xFF5A41F5),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 10.w),

                  /// SPACE FOR IMAGE
                  SizedBox(width: 70.w),
                ],
              ),
            ),
          ),
        ),

        /// 🔥 FLOATING AI IMAGE
        Positioned(
          left: 150.w,
          top: 1.h,
          child: Container(
            height: 190.h,
            width: 230.w,

            child: Image.asset(
              "assets/images/ai_tutor.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}