import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    return Scaffold(
      backgroundColor: AppColors.scaffoldGradientStart,
      body: SafeArea(
          child: isTablet
              ? SizedBox()
              :  SizedBox(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  padding: EdgeInsets.all(AppDimensions.d10.w),
                  width: double.infinity,
                  decoration: BoxDecoration(

                      color:AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(AppDimensions.d20.r)
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: const Text("Create Your Secure Pin").extrabold(color: Colors.black,size: AppDimensions.d22.sp)),
                      SizedBox(height: AppDimensions.d10.h,),
                      const Text("4-digit Pin").semiBold(color: Colors.black,size: AppDimensions.d17.sp),

                      SizedBox(height: 10.h,),
                      TextField(
                        style: GoogleFonts.roboto(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fontColor,
                        ),
                        decoration: InputDecoration(

                            filled: true,
                            fillColor: AppColors.white,
                            hintText: "Enter your Pin",
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.fontColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                                borderSide: BorderSide(color: Colors.white)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                                borderSide: BorderSide(color: Colors.white)
                            )
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      const Text("Confirm Pin").semiBold(color: Colors.black,size: AppDimensions.d17.sp),
                      SizedBox(height: 10.h,),
                      TextField(
                        style: GoogleFonts.roboto(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fontColor,
                        ),
                        decoration: InputDecoration(

                            filled: true,
                            fillColor: AppColors.white,
                            hintText: "Confirm your Pin",
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.fontColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                                borderSide: BorderSide(color: Colors.white)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AppDimensions.d10.r),
                                borderSide: BorderSide(color: Colors.white)
                            )
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      const Text("This Pin is used for Quick Login").medium(color: Colors.black,size: AppDimensions.d17.sp),


                      SizedBox(height: 100.h,),
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
                          child: TextButton(onPressed: (){},
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(AppDimensions.d10.r)
                                      )
                                  )
                              ),





                              child: Text("Secure Account").medium(color: AppColors.white,size: AppDimensions.d15.sp)))
                    ],
                  ),

                )
              ],
            ),
          ).paddingHorizontal(AppDimensions.d20.w)
      ),
    );
  }
}

// import 'package:aos/features/auth/presentation/widgets/auth_background.dart';
// import 'package:aos/features/auth/presentation/widgets/auth_button.dart';
// import 'package:aos/features/auth/presentation/widgets/auth_form.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class RegisterScreen extends StatelessWidget {
//   final email = TextEditingController();
//   final password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return AuthBackground(
//       child: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Register",
//                 style: TextStyle(color: Colors.white, fontSize: 24)),
//
//             AuthForm(email: email, password: password),
//
//             SizedBox(height: 20),
//             AuthButton(title: "Create Account", onTap: () {}),
//           ],
//         ),
//       ),
//     );
//   }
// }
