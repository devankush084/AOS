import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';

class ShowSnackBar{
  void showErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please type the message"),
        duration: Duration(seconds: 2),
        backgroundColor: AppColors.chatMessageColor,
      ),
    );
  }
}