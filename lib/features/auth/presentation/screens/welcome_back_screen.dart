import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/constants/app_images.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeBackScreen extends ConsumerStatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  ConsumerState<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends ConsumerState<WelcomeBackScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            AppImages.bottomImage,
          ),
        ),
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: AppColors.scaffoldGradientStart,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: const Text("Welcome Back").extrabold(
                        color: Colors.black, size: AppDimensions.d22.sp,letterSpacing: 1)),
                SizedBox(
                  height: AppDimensions.d30.h,
                ),
                const Text("Enter 4-digit Pin")
                    .semiBold(color: Colors.black, size: AppDimensions.d15.sp),
                SizedBox(height: 10.h),
                TextField(
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color:AppColors.fontColor,
                  ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.pin,color: AppColors.colorF6500E2,),
                      filled: true,
                      fillColor: AppColors.white,
                      hintText: "Enter your Pin",
                      hintStyle: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: AppColors.fontColor.withOpacity(0.4),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                          borderSide: BorderSide(color: AppColors.colorDAD6D6,width: 2)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                          borderSide: BorderSide(color: AppColors.colorDAD6D6,width: 2)
                      )
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Forgot Pin?").bold(
                        color: AppColors.fontColor, size: AppDimensions.d15.sp,letterSpacing: 1),
                  ],
                )
              ],
            ),
          ).paddingHorizontal(AppDimensions.d20.w),
        ),
      ],
    ));
  }
}