import 'package:aos/Core/constants/app_images.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.aiTutor,height: 500,)

            ],
          ),
        ),


      ),
    );
  }
}
