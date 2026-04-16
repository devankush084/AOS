import 'dart:ui';
import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppChip extends StatelessWidget {
  final String label;
  final Color? color;
  final VoidCallback? onTap;
  final bool isSelect;


  const AppChip({
    super.key,
    required this.label,
     this.color,
     this.onTap,
     this.isSelect = false
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style:  TextStyle(fontSize:isTablet ? 20 : AppDimensions.d12.sp,fontWeight: FontWeight.w800,color: AppColors.colorA8A6A6),
        ),
        backgroundColor: isSelect? AppColors.chipBackground:  AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.d20.r),

        ),

      ),
    );
  }
}