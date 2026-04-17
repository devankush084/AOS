import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/core/constants/app_images.dart';
import 'package:aos/features/courses/presentation/providers/course_video_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class CourseOverviewScreen extends ConsumerStatefulWidget {
  const CourseOverviewScreen({super.key});

  @override
  ConsumerState<CourseOverviewScreen> createState() =>
      _CourseOverviewScreenState();
}

class _CourseOverviewScreenState extends ConsumerState<CourseOverviewScreen> {







  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;


    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.white, AppColors.scaffoldGradientCenter,],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: isTablet ? 80 : 60,
            backgroundColor: AppColors.appBarColor,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ).paddingOnly(left: AppDimensions.d26.w),
            ),
            title: Text("Mathematics Fundamental")
                .extrabold(color: AppColors.white, size: (isTablet ? 28 :AppDimensions.d19.sp)),
          ),
          body: SafeArea(
              child: Stack(
                  children: [isTablet ?
                  SizedBox(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),

                              child: Image.asset(AppImages.bookThumbnail,height: 300.h,)),
                        ),

                        SizedBox(height: 10,),

                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [


                            _teacherInfo(isTablet),
                            Column(
                              children: [
                                SizedBox(

                                  width: 300,
                                  child: Wrap(
                                    spacing:  5.w,
                                    runSpacing: 10.h,
                                    children: [
                                      _infoItem(Icons.star, "4.8", true),
                                      _infoItem(Icons.group, "1200", true),
                                      _infoItem(Icons.history_toggle_off_sharp, "10 hours", true),
                                      _infoItem(Icons.my_library_books_rounded, "12 Lessons", true),
                                    ],
                                  ),
                                )
                              ],

                            ),





                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Courses Overview:")
                            .extrabold(color: Colors.black, size: 34),
                        Text("Learn Python basics and how they apply to analyzing large data sets. This practical course provides a solid foundation for further studies in data science and AI.")
                            .semiBold(
                            color: AppColors.color4E4E4E, size: 20),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Your Progress").extrabold(
                                color: AppColors.color4E4E4E, size:20),
                            Text("70% Completed").extrabold(
                                color: AppColors.color4E4E4E, size:20),
                          ],
                        ),
                        SizedBox(height: 10,),
                        ClipRRect(
                          borderRadius:
                          BorderRadius.circular(AppDimensions.d10.r),
                          child: LinearProgressIndicator(
                            value: 0.8,
                            minHeight: AppDimensions.d10.h,
                            backgroundColor: AppColors.color917FF2,
                            valueColor: const AlwaysStoppedAnimation(
                                AppColors.colorF6500E2),
                          ),
                        ),
                        const Spacer(),

                        Center(child: _actionButton(text: "Start Learning", onTap: (){}, isTablet: isTablet)),
                        SizedBox(height: 10,),

                      ],
                    ),

                  ).paddingHorizontal(20)
                      :
                  SizedBox(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppDimensions.d24.h,
                        ),
                        Image.asset(AppImages.thumbnail),
                        SizedBox(
                          height: AppDimensions.d23.h,
                        ),

                        Wrap(
                          spacing: 18.w,        // horizontal gap
                          runSpacing: 8.h,      // vertical gap (when it goes to next line)
                          children: [
                            _infoItem(Icons.star, "4.8", false),
                            _infoItem(Icons.group, "1200", false),
                            _infoItem(Icons.history_toggle_off_sharp, "10 hours", false),
                            _infoItem(Icons.my_library_books_rounded, "12 Lessons", false),
                          ],
                        ),

                        SizedBox(
                          height: AppDimensions.d23.h,
                        ),

                        _teacherInfo(isTablet),
                        SizedBox(
                          height: AppDimensions.d23.h,
                        ),


                        SizedBox(
                          height: AppDimensions.d19.h,
                        ),


                        Text("Courses Overview:")
                            .extrabold(color: Colors.black, size:AppDimensions.d17.sp),
                        Text("Learn Python basics and how they apply to analyzing large data sets. This practical course provides a solid foundation for further studies in data science and AI.This practical course provides a solid foundation for further studies in data science and AI")
                            .semiBold(
                            color: AppColors.color4E4E4E, size:AppDimensions.d14.sp),
                        SizedBox(
                          height: AppDimensions.d14.h,
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Your Progress").extrabold(
                                        color: AppColors.color4E4E4E, size:AppDimensions.d14.sp),
                                    Text("70% Completed").extrabold(
                                        color: AppColors.color4E4E4E, size:AppDimensions.d14.sp),
                                  ],
                                ),
                                SizedBox(
                                  height: AppDimensions.d14.h,
                                ),
                                ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(AppDimensions.d10.r),
                                  child: LinearProgressIndicator(
                                    value: 0.8,
                                    minHeight: AppDimensions.d10.h,
                                    backgroundColor: AppColors.color917FF2,
                                    valueColor: const AlwaysStoppedAnimation(
                                        AppColors.colorF6500E2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        _actionButton(text: "Start Learning", onTap: (){}, isTablet: isTablet),


                      ],
                    ),
                  ).paddingHorizontal(AppDimensions.d30.w),]
              )
          )
      ),
    );
  }

  Widget _teacherInfo(bool isTablet ){
    return  Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(   crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mathematics Fundamental")
                .extrabold(color: Colors.black,size:isTablet ? 28: AppDimensions.d19.sp),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: isTablet ? 30 :AppDimensions.d15.r,
                  child: Image.asset(AppImages.courseTeacher),
                ),
                SizedBox(width: 30,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr. John Smith").bold(
                        color: AppColors.fontColor,
                        size: isTablet? 20:  AppDimensions.d10.sp  ),
                    Text("4.8 Rating | 12.5k Students").bold(
                        color: AppColors.fontColor,
                        size: isTablet ? 20 : AppDimensions.d10.sp),

                  ],
                )

              ],
            ),
            SizedBox(
              width: AppDimensions.d12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



              ],
            )
          ],
        )

      ],
    );
  }

  Widget _infoItem(IconData icon, String title, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.d10.r),
        color: Colors.grey.withOpacity(0.2)
      ),
      child: Row(mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              size: isTablet ? 20 : AppDimensions.d20.h,
              color: AppColors.appBarColor),
          SizedBox(width: 5.w,),

          Text(title).extrabold(
            color: Colors.black,
            size: isTablet ? 14 : AppDimensions.d14.sp,
          ),

        ],
      ).paddingSymmetric(horizontal: 20,vertical: 5),
    );
  }

  Widget _actionButton({
    required String text,
    required VoidCallback onTap,
    IconData? icon,
    bool isPrimary = true,
    required bool isTablet,
  }) {
    double scale = isTablet ? 1.2 : 1;

    return SizedBox(
      height: AppDimensions.d53.h,
      width:isTablet ? 600: double.infinity,
      child: icon == null
          ? OutlinedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            isPrimary ? AppColors.colorF6500E2 : Colors.transparent,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(AppDimensions.d20.r),
            ),
          ),
        ),
        child: Text(text).extrabold(
          color: isPrimary
              ? AppColors.white
              : AppColors.colorF6500E2,
          size: isTablet ? 20 : AppDimensions.d20.sp,
        ),
      )
          : OutlinedButton.icon(
        icon: Icon(
          icon,
          color: AppColors.colorF6500E2,
          size: AppDimensions.d34.h * scale,
        ),
        onPressed: onTap,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(AppDimensions.d20.r),
            ),
          ),
          side: WidgetStatePropertyAll(
            BorderSide(
              color: AppColors.colorF6500E2,
              width: AppDimensions.d3.w,
            ),
          ),
        ),
        label: Text(text).extrabold(
          color: AppColors.colorF6500E2,
          size: AppDimensions.d18.sp * scale,
        ),
      ),
    );
  }
}
