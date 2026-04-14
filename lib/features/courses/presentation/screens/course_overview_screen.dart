import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseOverviewScreen extends ConsumerStatefulWidget {
  const CourseOverviewScreen({super.key});

  @override
  ConsumerState<CourseOverviewScreen> createState() =>
      _CourseOverviewScreenState();
}

class _CourseOverviewScreenState extends ConsumerState<CourseOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.white, AppColors.scaffoldGradientCenter],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ).paddingOnly(left: AppDimensions.d26.w),
          ),
          title: Text("Mathematics Fundamental")
              .extrabold(color: AppColors.white, size: AppDimensions.d19.sp),
        ),
        body: SafeArea(
            child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppDimensions.d24.h,
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: AppDimensions.d132.h,
              //   child: Image.asset("assets/images/course_overView.png",height: 132,width: 330,),
              // ),
              Container(
                height: AppDimensions.d132.h,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(AppDimensions.d20.r)),
              ),
              SizedBox(
                height: AppDimensions.d23.h,
              ),
              Text("Mathematics Fundamental")
                  .extrabold(color: Colors.black, size: AppDimensions.d19.sp),
              Row(
                children: [
                  CircleAvatar(
                    radius: AppDimensions.d15.r,
                    child: Image.asset(AppImages.chatBot),
                  ),
                  SizedBox(width: AppDimensions.d12.w,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr. John Smith").bold(color: AppColors.fontColor,size:  AppDimensions.d10.sp),
                      Text("4.8 Rating | 12.5k Students").bold(color: AppColors.fontColor,size:  AppDimensions.d10.sp),
                    ],
                  )
                ],
              )
            ],
          ),
        ).paddingHorizontal(AppDimensions.d30.w)),
      ),
    );
  }
}
