import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToastHelper {
  static void show(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: AppDimensions.d100.h,
        left: AppDimensions.d20.w,
        right: AppDimensions.d20.w,
        child: _ToastWidget(message: message),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}

class _ToastWidget extends StatelessWidget {
  final String message;

  const _ToastWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.appBarColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            message,
            style:  TextStyle(color: Colors.white,fontSize: AppDimensions.d16.sp),
          ),
        ),
      ),
    );
  }
}