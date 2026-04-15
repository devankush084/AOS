import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseModuleScreen extends ConsumerStatefulWidget {
  const CourseModuleScreen({super.key});

  @override
  ConsumerState<CourseModuleScreen> createState() => _CourseModuleScreenState();
}

class _CourseModuleScreenState extends ConsumerState<CourseModuleScreen> {
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
          title: const Text("Mathematics Fundamental")
              .extrabold(color: AppColors.white, size: AppDimensions.d19.sp),
        ),

      ),
    );
  }
}
