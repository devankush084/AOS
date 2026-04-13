import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/constants/app_images.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/features/ai/presentation/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AiTutorScreen extends StatefulWidget {
  const AiTutorScreen({super.key});

  @override
  State<AiTutorScreen> createState() => _AiTutorScreenState();
}

class _AiTutorScreenState extends State<AiTutorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,

      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.white,

              AppColors.backgroundColor
            ],
          )
      ),
      child:  Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppDimensions.d20.h,),
              Container(
                width: 300.h,
                decoration: BoxDecoration(
                  color: AppColors.chatMessageColor,
                  borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.borderColor,
                      spreadRadius: AppDimensions.d2.r,
                        blurRadius: AppDimensions.d1.r,
                      offset: const Offset(0, 3)

                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: const Text("Personal Ai Buddy").bold(color: AppColors.white,size: AppDimensions.d20.sp)),
                ),
              ),
              SizedBox(height: AppDimensions.d20.h,),


              const Text("How may i help you today!").bold(color: AppColors.fontColor,size: AppDimensions.d20.sp),
              Image.asset(AppImages.chatBot,height: 500,),
              SizedBox(height: AppDimensions.d100.h,),
              RippleIconButton()
            ],
          ),
        ),


      ),
    );
  }
}
