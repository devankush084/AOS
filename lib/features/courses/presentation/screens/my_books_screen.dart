import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/constants/app_images.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/features/courses/presentation/widgets/custom_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'course_overview_screen.dart';

class MyBooksScreen extends ConsumerStatefulWidget {
  const MyBooksScreen({super.key});

  @override
  ConsumerState<MyBooksScreen> createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends ConsumerState<MyBooksScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final isTablet = size.shortestSide >= 600;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      decoration: const BoxDecoration(
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
          title: const Text("My Books").extrabold(
              color: AppColors.white,
              size: (isTablet ? 20 : AppDimensions.d19.sp)),
        ),
        body: SafeArea(
            child: isTablet ? SizedBox(
              child: Column(
                children: [
                  const Center(
                    child: SearchBar(
                      constraints: BoxConstraints(minHeight: 50),
                      elevation: WidgetStatePropertyAll(10),
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      leading: Icon(Icons.search, color: AppColors.fontColor),
                      hintText: "Search Courses",
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.d10.h,
                  ),
                  Center(
                    child: Wrap(spacing: AppDimensions.d10.w,
                      alignment: WrapAlignment.spaceEvenly,
                      runSpacing: AppDimensions.d10.h,
                      children: const [
                        AppChip(label: "All"),
                        AppChip(label: "Completed"),
                        AppChip(label: "In Progress"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.d10.h,
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final height = constraints.maxHeight;
                        final width = constraints.maxWidth;

                        final isSmallTablet = height < 700;

                        final itemHeight = isSmallTablet ? 240.0 : 300.0;
                        final imageHeight = isSmallTablet ? 80.0 : 100.0;

                        final titleSize = isSmallTablet ? 14.0 : 20.0;
                        final subtitleSize = isSmallTablet ? 12.0 : 18.0;
                        final buttonTextSize = isSmallTablet ? 14.0 : 20.0;

                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isSmallTablet ? 4 : 4,
                            mainAxisExtent: itemHeight,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.d20.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [


                                    Container(
                                      height: imageHeight,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey,
                                      ),
                                    ),

                                    SizedBox(height: 6),


                                    Text(
                                      "Mathematics",
                                      style: TextStyle(
                                        fontSize: titleSize,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.fontColor,
                                      ),
                                    ),

                                    SizedBox(height: 4),


                                    Text(
                                      "12 Chapters",
                                      style: TextStyle(
                                        fontSize: subtitleSize,
                                        color: AppColors.fontColor,
                                      ),
                                    ),

                                    SizedBox(height: 6),

                                    Row(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            child: LinearProgressIndicator(
                                              value: 0.8,
                                              minHeight: isSmallTablet ? 6 : 10,
                                              backgroundColor: AppColors
                                                  .color917FF2,
                                              valueColor: AlwaysStoppedAnimation(
                                                AppColors.colorF6500E2,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          "70%",
                                          style: TextStyle(
                                              fontSize: subtitleSize),
                                        )
                                      ],
                                    ),
                                    Spacer(),


                                    SizedBox(
                                      width: double.infinity,
                                      height: 40, child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CourseOverviewScreen(),));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.appBarColor,
                                        padding: EdgeInsets.symmetric(
                                          vertical: isSmallTablet ? 6 : 10,
                                        ),
                                      ),
                                      child: Text(
                                        "Start",
                                        style: TextStyle(
                                          fontSize: buttonTextSize,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )


                ],
              ),

            ).paddingSymmetric(horizontal: 10.w, vertical: 10.h)

                :
            SizedBox(
              child: Column(
                children: [
                  const SearchBar(

                    elevation: WidgetStatePropertyAll(10),
                    constraints: BoxConstraints(minHeight: 40),


                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    leading: Icon(Icons.search, color: AppColors.fontColor),
                    hintText: "Search Courses",
                  ),
                  SizedBox(
                    height: AppDimensions.d10.h,
                  ),
                  Center(
                    child: Wrap(spacing: AppDimensions.d10.w,
                      alignment: WrapAlignment.spaceEvenly,
                      runSpacing: AppDimensions.d10.h,
                      children: const [
                        AppChip(label: "All"),
                        AppChip(label: "Completed"),
                        AppChip(label: "In Progress"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.d10.h,
                  ),

                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(8.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 10.w,

                          // ✅ PERFECT BALANCED HEIGHT
                          mainAxisExtent: screenHeight < 700
                              ? 200.h // small devices (375x667)
                              : screenHeight < 850
                              ? 215.h
                              : 230.h
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                AppDimensions.d20.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [

                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(AppDimensions.d20.r),
                                ),
                                child: Image.asset(
                                  AppImages.subjectBook,
                                  width: double.infinity,

                                  fit: BoxFit.cover,
                                ),
                              ),

                              SizedBox(height: 6.h),

                              /// ✅ TITLE
                              Text("Mathematics")
                                  .extrabold(
                                  color: AppColors.fontColor, size: 12.sp),

                              SizedBox(height: 2.h),

                              /// ✅ SUBTITLE
                              Text("12 Chapters")
                                  .extrabold(
                                  color: AppColors.fontColor, size: 11.sp),

                              SizedBox(height: 6.h),

                              /// ✅ PROGRESS BAR
                              Row(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(
                                          AppDimensions.d10.r),
                                      child: LinearProgressIndicator(
                                        value: 0.7,
                                        minHeight: 4.h,
                                        backgroundColor: Colors.grey.shade300,
                                        valueColor: const AlwaysStoppedAnimation(
                                          AppColors.colorF6500E2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "70%",
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                ],
                              ),

                              Spacer(),

                              /// ✅ BUTTON (no flexible, no spacer)
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                    WidgetStatePropertyAll(
                                        AppColors.appBarColor),
                                  ),
                                  child: Text("Start").bold(
                                    color: AppColors.white,
                                    size: 12.sp,
                                  ),
                                ),
                              ),
                            ],
                          ).paddingAll(8.w),
                        );
                      },
                    ),
                  )


                ],
              ),
            )
        ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
      ),
    );
  }
}
