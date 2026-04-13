import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/features/ai/presentation/widgets/suggestion_chip_widget.dart';
import 'package:aos/features/courses/presentation/widgets/custom_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends   ConsumerState<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            colors: [
          AppColors.scaffoldGradientStart,
          AppColors.white,
          AppColors.scaffoldGradientCenter
        ])
      ),
      child:  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: AppDimensions.d43.h,
                    width: AppDimensions.d46.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(width: AppDimensions.d17.w,),
                  SizedBox(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning John",style: TextStyle(fontSize: AppDimensions.d16.sp,fontWeight: FontWeight.w900,color: AppColors.white),),
                        Text("Continue your learning journey").bold(color: AppColors.colorDAD6D6,size: AppDimensions.d10.sp)
                      ],
                    ),
                  )
                ],
              ).paddingSymmetric(vertical: 0,horizontal: 30),
                SizedBox(height: AppDimensions.d24.h,),
              SearchBar(
                leading:Icon(Icons.search,color: AppColors.fontColor,) ,
                hintText: "Search Courses",
                hintStyle: WidgetStatePropertyAll(TextStyle(color: AppColors.fontColor,fontWeight: FontWeight.w800,fontSize: AppDimensions.d14.sp))
              ).paddingOnly(left: AppDimensions.d33.w,right: AppDimensions.d35.w),
              SizedBox(height: AppDimensions.d23.h,),
              Wrap(
                spacing: AppDimensions.d15.w,
                children: const [
                  AppChip(label: "All", ),
                  AppChip(label: "Math"),
                  AppChip(label: "Science"),
                  AppChip(label: "Technology"),
                  AppChip(label: "Business"),
                  AppChip(label: "Programming"),
                  AppChip(label: "Design"),
                ],
              ).paddingOnly(left: AppDimensions.d30.w,right: AppDimensions.d30.w),
              SizedBox(height: AppDimensions.d23.h,),
 Text("Continue Learning").extrabold(color: AppColors.color4E4E4E)

            ],
          ),

        ),
      ),
    );
  }
}

