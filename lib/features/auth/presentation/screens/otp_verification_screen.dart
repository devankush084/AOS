import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/constants/app_images.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../providers/otp_provider.dart';

class OTPVerificationScreen extends ConsumerWidget {
  OTPVerificationScreen({super.key});

  /// ✅ 6 Controllers
  final controllers = List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery
        .of(context)
        .size;
    final isTablet = size.shortestSide >= 600;

    final state = ref.watch(otpProvider);

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
                boxShadow: const [
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
                  Image.asset(AppImages.loginImage),
                  SizedBox(height: 10.h),
                  const Text("Verify your identity").extrabold(
                      color: Colors.black,
                      size: AppDimensions.d32,
                      letterSpacing: 3),
                  SizedBox(height: 10.h),
                  Pinput(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    length: 6,


                  ),
                  SizedBox(height: 10.h),
                  
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, AppNames.createPinScreen);
                        }
                        ,child: const Text("Resend OTP").bold(
                            color: AppColors.fontColor,
                            size: AppDimensions.d15,
                            letterSpacing: 3),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history_toggle_off_sharp),
                      SizedBox(width: 10.w),

                      Text("30 Sec").medium(color: Colors.black,size: AppDimensions.d15.sp)
                    ],
                  )


                ],
              ),
            ).paddingHorizontal(AppDimensions.d20.w),
          ),
        ],
      ),
    );
  }
}