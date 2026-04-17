
import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery
        .of(context)
        .size;
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Yana AI").extrabold(color: Colors.black,size: AppDimensions.d32,letterSpacing: 3),
                  SizedBox(height: 5.h),
                  const Text("Africa Online School").medium(color: Colors.black,size: AppDimensions.d22),
                  SizedBox(height: 20.h),
              TextField(
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:AppColors.fontColor,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person,color: AppColors.colorF6500E2,),

                                filled: true,
                                fillColor: AppColors.white,
                                hintText: "Enter your LifeID",
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
               Image.asset(AppImages.loginImage),
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





                                  child: Text("Continue").medium(color: AppColors.white,size: AppDimensions.d17.sp,letterSpacing: 2)))
                ],
              ),
            ).paddingHorizontal(AppDimensions.d20.w),
          ),
        ],
      )
    );
  }
}






// import 'package:aos/Core/constants/app_dimensions.dart';
// import 'package:aos/Core/utils/app_extension.dart';
// import 'package:aos/config/theme/color_scheme.dart';
// import 'package:aos/core/constants/app_images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class LoginScreen extends ConsumerStatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   ConsumerState<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends ConsumerState<LoginScreen> {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.shortestSide >= 600;
//
//
//     return Scaffold(
//       backgroundColor: AppColors.scaffoldGradientStart,
//       body: SafeArea(
//           child:
//
//
//           isTablet ?
//           SizedBox(
//             child: Stack(
//               children: [Column(mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//
//
//
//                   Center(
//                     child: Container(
//
//                       padding: EdgeInsets.all(AppDimensions.d10.w),
//                       width: 600,
//
//                       decoration: BoxDecoration(
//
//                           color:AppColors.backgroundColor,
//                           borderRadius: BorderRadius.circular(AppDimensions.d20.r)
//                       ),
//                       child: Column(
//                         children: [
//                           const Text("Yana AI").extrabold(color: Colors.black,size: AppDimensions.d32),
//                           const Text("Africa Online School").medium(color: Colors.black,size: AppDimensions.d22),
//
//                           SizedBox(height: 20.h,),
//                           TextField(
//                             style: GoogleFonts.roboto(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black,
//                             ),
//                             decoration: InputDecoration(
//
//                                 filled: true,
//                                 fillColor: AppColors.white,
//                                 hintText: "Enter your LifeID",
//                                 hintStyle: GoogleFonts.roboto(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w900,
//                                   color: Colors.black,
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(AppDimensions.d10.r),
//                                     borderSide: BorderSide(color: Colors.white)
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(AppDimensions.d10.r),
//                                     borderSide: BorderSide(color: Colors.white)
//                                 )
//                             ),
//                           ),
//
//                           SizedBox(height: 100.h,),
//                           Container(
//                             height: 60.h,
//
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(AppDimensions.d10.r),
//
//                                 gradient:
//                                 const LinearGradient(
//                                   colors: [
//                                     Color(0xFF5F2EEA),
//                                     Color(0xFF7B61FF),
//                                   ],
//                                 ),
//                               ),
//                               child: TextButton(onPressed: (){},
//                                   style: ButtonStyle(
//                                       shape: WidgetStatePropertyAll(
//                                           RoundedRectangleBorder(
//                                               borderRadius: BorderRadius.circular(AppDimensions.d10.r)
//                                           )
//                                       )
//                                   ),
//
//
//
//
//
//                                   child: Text("Continue").medium(color: AppColors.white,size: AppDimensions.d24)))
//                         ],
//                       ),
//
//                     ),
//                   )
//                 ],
//               )],
//             ),
//           ).paddingHorizontal(AppDimensions.d20.w) :
//
//
//           SizedBox(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//
//             Container(
//             padding: EdgeInsets.all(AppDimensions.d10.w),
//               width: double.infinity,
//               decoration: BoxDecoration(
//
//                 color:AppColors.backgroundColor,
//                 borderRadius: BorderRadius.circular(AppDimensions.d20.r)
//               ),
//               child: Column(
//                 children: [
//                   const Text("Yana AI").extrabold(color: Colors.black,size: AppDimensions.d32.sp),
//                   const Text("Africa Online School").medium(color: Colors.black,size: AppDimensions.d22.sp),
//
//                   SizedBox(height: 20.h,),
//                   TextField(
//                     style: GoogleFonts.roboto(
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.fontColor,
//                     ),
//                     decoration: InputDecoration(
//
//                       filled: true,
//                       fillColor: AppColors.white,
//                       hintText: "Enter your LifeID",
//                       hintStyle: GoogleFonts.roboto(
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.w900,
//                         color: AppColors.fontColor,
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(AppDimensions.d10.r),
//                         borderSide: BorderSide(color: Colors.white)
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(AppDimensions.d10.r),
//                           borderSide: BorderSide(color: Colors.white)
//                       )
//                     ),
//                   ),
//
//                   SizedBox(height: 100.h,),
//                   Container(
//                     height: 50.h,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(AppDimensions.d10.r),
//
//                           gradient:
//                         const LinearGradient(
//                           colors: [
//                             Color(0xFF5F2EEA),
//                             Color(0xFF7B61FF),
//                           ],
//                         ),
//                       ),
//                       child: TextButton(onPressed: (){},
//                           style: ButtonStyle(
//                             shape: WidgetStatePropertyAll(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(AppDimensions.d10.r)
//                               )
//                             )
//                           ),
//
//
//
//
//
//                           child: Text("Continue").medium(color: AppColors.white,size: AppDimensions.d15.sp)))
//                 ],
//               ),
//
//             )
//           ],
//         ),
//       ).paddingHorizontal(AppDimensions.d20.w)
//       ),
//     );
//   }
// }
