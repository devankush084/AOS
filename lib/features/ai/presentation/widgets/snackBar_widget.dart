import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBar {
  // Show error snackbar
  static void showError(
      BuildContext context, {
        required String message,
        Duration duration = const Duration(seconds: 2),
      }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.red.shade700,
      duration: duration,
    );
  }

  // Show success snackbar
  static void showSuccess(
      BuildContext context, {
        required String message,
        Duration duration = const Duration(seconds: 2),
      }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.green.shade700,
      duration: duration,
    );
  }

  // Show warning snackbar
  static void showWarning(
      BuildContext context, {
        required String message,
        Duration duration = const Duration(seconds: 2),
      }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.orange.shade700,
      duration: duration,
    );
  }

  // Show info snackbar
  static void showInfo(
      BuildContext context, {
        required String message,
        Duration duration = const Duration(seconds: 2),
      }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: AppColors.chatMessageColor,
      duration: duration,
    );
  }

  // Generic private method
  static void _showSnackBar(
      BuildContext context, {
        required String message,
        required Color backgroundColor,
        Duration duration = const Duration(seconds: 2),
      }) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(message).bold(color: AppColors.white,size: AppDimensions.d20.sp),
        )),
        duration: duration,
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}