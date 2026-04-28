import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCoursesSection extends StatelessWidget {
  const MyCoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      {"title": "Flutter UI Mastery", "progress": 0.5},
      {"title": "Advanced Animations", "progress": 0.7},
      {"title": "Clean Architecture", "progress": 0.3},
      {"title": "State Management Pro", "progress": 0.8},
      {"title": "API Integration", "progress": 0.4},
    ];

    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 170.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];

          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: CourseItem(
              width: screenWidth * 0.42, // 🔥 RESPONSIVE WIDTH
              title: course["title"] as String,
              progress: course["progress"] as double,
            ),
          );
        },
      ),
    );
  }
}
class CourseItem extends StatelessWidget {
  final String title;
  final double progress;
  final double width;

  const CourseItem({
    super.key,
    required this.title,
    required this.progress,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return SizedBox(
      width: width,
      child: Container(
        constraints: const BoxConstraints(minHeight: 150),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFFA8A6A6)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
=======
    return Container(
      width: width, // ✅ responsive
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Stack(
>>>>>>> 198a8b0 (S1 final work)
              children: [
                Image.asset(
                  "assets/images/Course1.png",
                  height: 70.h, // 🔥 balanced
                  width: double.infinity,
<<<<<<< HEAD
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4A6AFF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/Course1.png",
                      fit: BoxFit.cover,
=======
                  fit: BoxFit.cover,
                ),

                Positioned(
                  right: 6.w,
                  top: 6.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 6.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      "${(progress * 100).toInt()}%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
>>>>>>> 198a8b0 (S1 final work)
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8.h),

          /// TITLE
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2E2E2E),
            ),
          ),

          SizedBox(height: 8.h),

          /// PROGRESS BAR
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 5.h,
              backgroundColor: Colors.grey.shade300,
              valueColor:
              AlwaysStoppedAnimation(Color(0xFF5A41F5)),
            ),
          ),
        ],
      ),
    );
  }
}