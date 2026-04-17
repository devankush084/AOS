import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/constants/app_images.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

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
        body: Stack(clipBehavior: Clip.none,
          alignment: Alignment.center,
      children: [

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
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [


              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 60.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.white,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    /// TITLE
                    Text(
                      "Welcome Back",

                    ).extrabold(color: Colors.black,size: 22.sp,letterSpacing: 2),

                    SizedBox(height: 20.h),

                    Text(
                      "Enter 4-digit PIN",
                    ).extrabold(color: Colors.black,size: 15.sp,letterSpacing: 1),

                    SizedBox(height: 15.h),


                    TextField(
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color:AppColors.fontColor,
                      ),
                      decoration: InputDecoration(

                          filled: true,
                          fillColor: AppColors.white,
                          hintText: "Enter your LifeID",
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

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, AppNames.resetPassword);
                        }
                       , child: Text(
                          "Forgot PIN?",

                        ).medium(color: AppColors.fontColor,size: 15.sp,letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),

              /// 👤 AVATAR
              Positioned(
                top: -40.h,
                child: CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 34.r,
                    backgroundImage: AssetImage(AppImages.courseTeacher),
                  ),
                ),
              ),

              /// 🟣 FINGERPRINT BUTTON
              Positioned(
                bottom: -35.h,
                child: Container(
                  height: 70.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.scaffoldGradientStart,
                        AppColors.scaffoldGradientStart.withOpacity(0.7),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.scaffoldGradientStart.withOpacity(0.4),
                        blurRadius: 20,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.fingerprint,
                    color: Colors.white,
                    size: 35.sp,
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    ));
  }
}