import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 15,
            offset: Offset(0, 8),
          )
        ],
      ),
      child: Column(
        children: [
          _notificationItem(
            icon: Icons.notifications,
            color: Colors.blue,
            bgColor: Colors.blue.shade100,
            title: "New Update",
            subtitle: "Your course progress has been updated",
            time: "1 hr ago",
          ),

          Divider(height: 20.h),

          _notificationItem(
            icon: Icons.message,
            color: Colors.orange,
            bgColor: Colors.orange.shade100,
            title: "New Message",
            subtitle: "You received a message from mentor",
            time: "2 hr ago",
          ),
        ],
      ),
    );
  }

  Widget _notificationItem({
    required IconData icon,
    required Color color,
    required Color bgColor,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔥 ICON
        Container(
          height: 42.w,
          width: 42.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor,
          ),
          child: Icon(icon, color: color, size: 20.sp),
        ),

        SizedBox(width: 10.w),

        /// 🔥 TEXT
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E2E2E),
                ),
              ),

              SizedBox(height: 2.h),

              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        /// 🔥 TIME
        Text(
          time,
          style: TextStyle(
            fontSize: 11.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}