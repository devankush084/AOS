import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/constants/app_images.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePinScreen extends ConsumerStatefulWidget {
  const CreatePinScreen({super.key});

  @override
  ConsumerState<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends ConsumerState<CreatePinScreen> {
<<<<<<< HEAD
=======
  final TextEditingController pinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();

>>>>>>> 198a8b0 (S1 final work)
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    return Scaffold(
<<<<<<< HEAD
        body: Stack(
=======
      body: isTablet ? _tabletUI(context) : _mobileUI(context),
    );
  }

  /// 🔥 COMMON INPUT FIELD
  Widget _pinField({
    required String hint,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 4,
      obscureText: true,
      style: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.fontColor,
      ),
      decoration: InputDecoration(
        counterText: "",
        prefixIcon: Icon(Icons.password,),
        filled: true,
        fillColor: AppColors.white,
        hintText: hint,
        hintStyle: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.fontColor.withOpacity(0.4),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.d10.r),
          borderSide: BorderSide(color: AppColors.colorDAD6D6),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.d10.r),
          borderSide: BorderSide(color: AppColors.colorDAD6D6),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.d10.r),
          borderSide: BorderSide( width: 2),
        ),
      ),
    );
  }

  /// 🔥 BUTTON
  Widget _button(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.d10.r),
        gradient: const LinearGradient(
          colors: [Color(0xFF5F2EEA), Color(0xFF7B61FF)],
        ),
      ),
      child: TextButton(
        onPressed: () {
          if (pinController.text != confirmPinController.text) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Pins do not match")),
            );
            return;
          }

          if (pinController.text.length != 4) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Enter valid 4-digit pin")),
            );
            return;
          }

          Navigator.pushNamed(context, AppNames.welcomeBack);
        },
        child: Text("Secure Account").medium(
          color: AppColors.white,
          size: 18,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  /// 🔥 TABLET UI
  Widget _tabletUI(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(child: Container(color: AppColors.scaffoldGradientStart)),
            Expanded(child: Container(color: Colors.white)),
          ],
        ),
        Center(
          child: Container(
            width: 400.w,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
            ),
            child: _form(context),
          ),
        ),
      ],
    );
  }

  /// 🔥 MOBILE UI
  Widget _mobileUI(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(AppImages.bottomImage),
        ),
        Column(
>>>>>>> 198a8b0 (S1 final work)
          children: [
            Expanded(child: Container(color: AppColors.scaffoldGradientStart)),
            Expanded(child: Container(color: Colors.white)),
          ],
        ),
        Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10),
                ],
              ),
              child: _form(context),
            ),
          ),
        ),
      ],
    );
  }

  /// 🔥 FORM
  Widget _form(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            AppImages.loginImage,
            width: 100.w,
          ),
        ),
        SizedBox(height: 12.h),

        Center(
          child: Text("Create Your Secure Pin").extrabold(
            color: Colors.black,
            size: AppDimensions.d20.sp,
          ),
        ),

<<<<<<< HEAD
            Center(
              child: SingleChildScrollView(
                child: Container(
                
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(AppImages.loginImage),
                      SizedBox(height: AppDimensions.d10.h,),
                
                      Center(child: const Text("Create Your Secure Pin").extrabold(color: Colors.black,size: AppDimensions.d22.sp,letterSpacing: 1)),
                      SizedBox(height: AppDimensions.d10.h,),
                
                      Text("4-digit Pin").semiBold(color: Colors.black,size: AppDimensions.d17.sp,letterSpacing: 1),
                      SizedBox(height: 10),
                      TextField(
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color:AppColors.fontColor,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password,color: AppColors.colorF6500E2,),
                
                            filled: true,
                            fillColor: AppColors.white,
                            hintText: "Enter 4-digit Pin",
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
                      SizedBox(height: 10),
                      const Text("Confirm Pin").semiBold(color: Colors.black,size: AppDimensions.d17.sp,letterSpacing: 1),
                      SizedBox(height: 10),
                      TextField(
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color:AppColors.fontColor,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password,color: AppColors.colorF6500E2,),
                
                            filled: true,
                            fillColor: AppColors.white,
                            hintText: "Confirm Your Pin",
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
                      SizedBox(height: 10),
                
                      const Text("This Pin is used for Quick Login").medium(color: AppColors.fontColor,size: AppDimensions.d17.sp,letterSpacing: 1),
                      SizedBox(height:50.h),
                      Container(
                          height: 50.h,
                
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                
                            gradient:
                            const LinearGradient(
                              colors: [
                                Color(0xFF5F2EEA),
                                Color(0xFF7B61FF),
                              ],
                            ),
                          ),
                          child: TextButton(onPressed: (){
                            
                            Navigator.pushNamed(context, AppNames.welcomeBack);
                          },
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(AppDimensions.d10.r)
                                      )
                                  )
                              ),
                
                
                
                
                
                              child: Text("Secure Account").medium(color: AppColors.white,size: AppDimensions.d17.sp,letterSpacing: 2)))
                    ],
                  ),
                ).paddingHorizontal(AppDimensions.d20.w),
              ),
            ),
          ],
        )
=======
        SizedBox(height: 16.h),

        Text("4-digit Pin").semiBold(
          color: Colors.black,
          size: AppDimensions.d16.sp,
        ),
        SizedBox(height: 8.h),
        _pinField(
          hint: "Enter 4-digit Pin",
          controller: pinController,
        ),

        SizedBox(height: 12.h),

        Text("Confirm Pin").semiBold(
          color: Colors.black,
          size: AppDimensions.d16.sp,
        ),
        SizedBox(height: 8.h),
        _pinField(
          hint: "Confirm Your Pin",
          controller: confirmPinController,
        ),

        SizedBox(height: 12.h),

        Text("This Pin is used for Quick Login").medium(
          color: AppColors.fontColor,
          size: AppDimensions.d14.sp,
        ),

        SizedBox(height: 30.h),

        _button(context),
      ],
>>>>>>> 198a8b0 (S1 final work)
    );
  }
}