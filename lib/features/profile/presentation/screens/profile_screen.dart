<<<<<<< HEAD
=======
import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    return Container(
      decoration: BoxDecoration(
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
            onTap: () {},
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ).paddingOnly(left: AppDimensions.d26.w),
          ),
          title: Text("Profile").extrabold(
              color: AppColors.white,
              size: (isTablet ? 28 : AppDimensions.d19.sp),
              letterSpacing: 1),
        ),
        body: Stack(
          children: [


            Container(
              height: 170.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.appBarColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 120),


                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [


                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.only(top: 60.h, bottom: 6.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color: const Color(0xFFC5C5C5), width: 2.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.r,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Text("Name Shanah").bold(
                                size: 16.sp,
                                color: Colors.black,
                                letterSpacing: 1),
                            const SizedBox(height: 4),
                            Text("Life ID: AOS-2026-XXXX").medium(
                                size: 12.sp,
                                color: AppColors.fontColor),
                          ],
                        ),
                      ),


                      Positioned(
                        top: -40.h,
                        child: Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: CircleAvatar(
                            radius: 40.r,
                            backgroundImage: const NetworkImage(
                              "https://i.pravatar.cc/150?img=3",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            color: const Color(0xFFC5C5C5), width: 2.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4.r,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Info").bold(
                              size: 16.sp,
                              color: Colors.black,
                              letterSpacing: 1),

                          SizedBox(height: 12.h),

                          _infoRow("School Name", "African Online School"),
                          _divider(),
                          _infoRow("Grade", "8/8"),
                          _divider(),
                          _infoRow("Email", "samonon@gmail.com"),
                          _divider(),
                          _infoRow("Phone", "+91 9876543210"),
                          _divider(),
                          _infoRow("DOB", "12 Aug 2010"),
                          _divider(),
                          _infoRow("Address", "New, South Africa"),
                        ],
                      ).paddingAll(20),
                    ),
                  ),

                  const SizedBox(height: 20),


                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Container(
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10.r),
                  //       border: Border.all(
                  //           color: const Color(0xFFC5C5C5), width: 2.w),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black26,
                  //           blurRadius: 4.r,
                  //           offset: const Offset(0, 4),
                  //         )
                  //       ],
                  //     ),
                  //     // child: Column(
                  //     //   crossAxisAlignment: CrossAxisAlignment.start,
                  //     //   children: [
                  //     //     Text("Settings").bold(
                  //     //         size: 16.sp,
                  //     //         color: Colors.black,
                  //     //         letterSpacing: 1),
                  //     //     SizedBox(height: 10.h),
                  //     //
                  //     //     // _settingRow(Icons.edit, "Edit Profile"),
                  //     //     // _settingRow(Icons.lock_outline, "Change Pin"),
                  //     //     // _settingRow(Icons.sync, "Device Sync"),
                  //     //     // _settingRow(Icons.logout, "Logout", showArrow: false),
                  //     //   ],
                  //     // ).paddingAll(20),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _settingRow(IconData icon, String text,
      {bool showArrow = true}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(text).medium(
                size: 14.sp,
                color: Colors.black,
                letterSpacing: 1),
          ),
          if (showArrow)
            const Icon(Icons.arrow_forward_ios_outlined,
                color: Color(0xFFA8A6A6)),
        ],
      ),
    );
  }
}
Widget _infoRow(String title, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 6.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title).medium(
          size: 14.sp,
          color: AppColors.fontColor,
        ),
        Flexible(
          child: Text(value).medium(
            size: 14.sp,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );
}

Widget _divider() {
  return Divider(
    color: Colors.grey.shade300,
    thickness: 1,
  );
}
>>>>>>> 198a8b0 (S1 final work)
