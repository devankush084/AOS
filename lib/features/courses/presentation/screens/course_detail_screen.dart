import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/constants/app_images.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/features/ai/presentation/widgets/suggestion_chip_widget.dart';
import 'package:aos/features/courses/presentation/widgets/custom_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  ConsumerState<CourseDetailScreen> createState() =>
      _CourseDetailScreenState();
}

class _CourseDetailScreenState
    extends ConsumerState<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.scaffoldGradientStart,
            AppColors.white,
            AppColors.scaffoldGradientCenter
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimensions.d20.h),

                  Row(
                    children: [
                      Container(
                        height: AppDimensions.d45.w,
                        width: AppDimensions.d45.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: AppDimensions.d12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning John",
                            ).extrabold(
                                color: AppColors.white,
                                size: AppDimensions.d16.sp),
                            Text(
                              "Continue your learning journey",
                            ).medium(
                                color: AppColors.colorDAD6D6,
                                size: AppDimensions.d10.sp),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: AppDimensions.d24.h),

                  SearchBar(
                    leading: Icon(Icons.search,
                        color: AppColors.fontColor),
                    hintText: "Search Courses",
                  ),

                  SizedBox(height: AppDimensions.d20.h),

                  Wrap(
                    spacing: AppDimensions.d10.w,
                    runSpacing: AppDimensions.d10.h,
                    children: const [
                      AppChip(label: "All"),
                      AppChip(label: "Math"),
                      AppChip(label: "Science"),
                      AppChip(label: "Technology"),
                      AppChip(label: "Business"),
                      AppChip(label: "Programming"),
                      AppChip(label: "Design"),
                    ],
                  ),

                  SizedBox(height: AppDimensions.d20.h),

                  Text("Continue Learning").extrabold(
                      color: AppColors.color4E4E4E,
                      size: AppDimensions.d16.sp),

                  SizedBox(height: AppDimensions.d14.h),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppDimensions.d16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.d20.r),
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.colorF6500E2,
                          AppColors.color917FF2
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text("Mathematics Fundamental")
                                  .extrabold(
                                  color: AppColors.white,
                                  size:
                                  AppDimensions.d14.sp),
                              SizedBox(
                                  height:
                                  AppDimensions.d10.h),
                              Text("Instructor Dr. John Smith")
                                  .medium(
                                  color: AppColors.white,
                                  size:
                                  AppDimensions.d14.sp),
                              SizedBox(
                                  height:
                                  AppDimensions.d12.h),

                              /// PROGRESS
                              Row(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(
                                          AppDimensions
                                              .d10.r),
                                      child:
                                      LinearProgressIndicator(
                                        value: 0.8,
                                        minHeight: 6,
                                        backgroundColor: Colors
                                            .white
                                            .withOpacity(0.3),
                                        valueColor:
                                        const AlwaysStoppedAnimation(
                                            Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text("80%")
                                      .medium(
                                      color: Colors.white,
                                      size: 10.sp),
                                ],
                              ),

                              SizedBox(
                                  height:
                                  AppDimensions.d10.h),

                              Text("Lesson: 7 of 10")
                                  .medium(
                                  color: Colors.white,
                                  size:
                                  AppDimensions.d12.sp),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                AppImages.courseImage,
                                height: 80.h,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 10.h),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style:
                                  ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Colors.white,
                                  ),
                                  child: Text("Continue")
                                      .bold(
                                      color: AppColors
                                          .colorF6500E2,
                                      size: 10.sp),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: AppDimensions.d26.h),

                  Text("Populor Courses").extrabold(
                      color: AppColors.color4E4E4E,
                      size: AppDimensions.d16.sp),

                  SizedBox(height: AppDimensions.d12.h),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _courseCard(),
                        SizedBox(width: 10.w),
                        _courseCard(),
                        SizedBox(width: 10.w),
                        _courseCard(),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _courseCard() {
    return SizedBox(
      width: 160.w,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(AppDimensions.d10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(
                    AppDimensions.d10.r),
              ),
            ),
            SizedBox(height: 8.h),

            Text(
              "Introduction to Programming",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ).extrabold(
                color: AppColors.color4E4E4E,
                size: AppDimensions.d11.sp),

            Text("Instructor Programming")
                .medium(
                color: AppColors.color4E4E4E,
                size: AppDimensions.d9.sp),

            SizedBox(height: 6.h),

            RatingStars(
              value: 4.5,
              starCount: 5,
              starSize: 14.sp,
              valueLabelVisibility: false,
              maxValue: 5,
              starSpacing: 2.w,
              starBuilder: (index, color) => Icon(
                Icons.star,
                color: const Color(0xFFECA839),
                size: 14.sp,
              ),
            ),

            SizedBox(height: 6.h),

            Row(
              children: [
                Icon(Icons.group, size: 14.sp),
                SizedBox(width: 4.w),
                Text("7 students").medium(size: 9.sp),
                const Spacer(),
                Icon(Icons.history, size: 14.sp),
                SizedBox(width: 4.w),
                Text("12h 13m").medium(size: 9.sp),
              ],
            ),

            SizedBox(height: 6.h),

            ClipRRect(
              borderRadius:
              BorderRadius.circular(AppDimensions.d10.r),
              child: LinearProgressIndicator(
                value: 0.8,
                minHeight: 6.h,
                backgroundColor: AppColors.color917FF2,
                valueColor: const AlwaysStoppedAnimation(
                    AppColors.colorF6500E2),
              ),
            ),

            SizedBox(height: 8.h),

            SizedBox(
              height: 24.h,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: Text("Resume").bold(
                    color: AppColors.colorF6500E2,
                    size: AppDimensions.d9.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}