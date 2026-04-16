import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ModuleCard extends StatefulWidget {
  final String module;
  final String title;
  final String description;
  final int lessons;
  final String duration;
  final double progress;
  final List<Map<String, dynamic>> topics;

  const ModuleCard({
    super.key,
    required this.title,
    required this.description,
    required this.lessons,
    required this.duration,
    required this.progress,
    required this.topics,
    required this.module
  });

  @override
  State<ModuleCard> createState() => _ModuleCardState();
}

class _ModuleCardState extends State<ModuleCard> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(bottom: 15.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.d10.r),
        border: Border.all(color: AppColors.fontColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: AppDimensions.d4.r,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${widget.module} ",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: AppDimensions.d17.sp,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: AppDimensions.d17.sp,
                          color: AppColors.fontColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 18.w),

              GestureDetector(
                onTap: (){
                  setState(() {
                    isExpand = !isExpand;
                  });
                },
                child: Icon(
                  isExpand
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down_outlined,
                ),
              ),
            ],
          ),

          /// EXPANDED CONTENT
          if (isExpand) ...[
            SizedBox(height: 7.h),

            Text(widget.description).semiBold(
                color: AppColors.fontColor,
                size: AppDimensions.d16.sp),

            SizedBox(height: 7.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Row(spacing: 10,
                   children: [
                     Icon(Icons.menu_book),
                     Text("${widget.lessons} Lessons").bold(
                         color: AppColors.fontColor,
                         size: AppDimensions.d12.sp),
                   ],
                 ),





                 Row(spacing: 10,
                   children: [
                     FaIcon(FontAwesomeIcons.clock),
                     Text(widget.duration).bold(
                         color: AppColors.fontColor,
                         size: AppDimensions.d12.sp),

                   ],
                 ),





              ],
            ),

            SizedBox(height: 7.h),




            ...widget.topics.map((topic) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 0,
                horizontalTitleGap: 10,
                leading: Container(
                  height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:AppColors.appBarColor.withOpacity(0.4)
                    ),
                    child: const Icon(Icons.video_collection_outlined,color: Colors.black,)),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(topic["title"]),
                    Text(topic["time"]),
                  ],
                ),
                trailing: Icon(topic["icon"],size: 20,),
              ).paddingVertical(5.h);
            }).toList()
          ]
        ],
      ).paddingAll(20),
    );
  }
}