import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"icon": FontAwesomeIcons.bookOpen, "title": "Courses"},
      {"icon": FontAwesomeIcons.addressBook, "title": "Library"},
      {"icon": FontAwesomeIcons.robot, "title": "AI Tutor"},
      {"icon": FontAwesomeIcons.book, "title": "Notes"},
    ];

<<<<<<< HEAD
        bool isTablet = constraints.maxWidth > 600;

        double boxSize = isTablet ? 110 : 80;
        double iconSize = isTablet ? 30 : 22;
        double spacing = isTablet ? 20 : 10;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              _buildItem(FontAwesomeIcons.bookOpen, boxSize, iconSize,),
              _buildItem(FontAwesomeIcons.addressBook, boxSize, iconSize,),
              _buildItem(FontAwesomeIcons.robot, boxSize, iconSize,),
              _buildItem(FontAwesomeIcons.book, boxSize, iconSize,),

            ],
          ),
        );
      },
=======
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((e) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: _QuickItem(
                icon: e["icon"] as IconData,
                title: e["title"] as String,
              ),
            ),
          );
        }).toList(),
      ),
>>>>>>> 198a8b0 (S1 final work)
    );
  }
}

<<<<<<< HEAD
  // 🔹 Reusable Widget
  Widget _buildItem(IconData icon, double boxSize, double iconSize) {
    return Container(
      height: boxSize,
      width: boxSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: const Color(0xFFA8A6A6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(2, 4),
          )
        ],
      ),
      child: Center(
        child:
        FaIcon(
          icon,
          size: iconSize,
          color: const Color(0xFF5A41F5),
=======
class _QuickItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _QuickItem({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: add navigation
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.95),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 15,
              offset: Offset(0, 8),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 🔥 ICON CONTAINER
            Container(
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF5A41F5),
                    Color(0xFF7B61FF),
                  ],
                ),
              ),
              child: Center(
                child: FaIcon(
                  icon,
                  size: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 8.h),

            /// 🔥 TITLE
            Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2E2E2E),
              ),
            ),
          ],
>>>>>>> 198a8b0 (S1 final work)
        ),
      ),
    );
  }
}