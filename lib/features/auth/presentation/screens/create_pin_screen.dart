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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                AppImages.bottomImage,

              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: AppColors.scaffoldGradientStart,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ],
            ),



            Center(
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
          ],
        )
    );
  }
}