import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final String? profileImage; // network image

  const ProfileHeader({
    super.key,
    required this.userName,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Row(
            children: [
              /// 🔥 PROFILE IMAGE
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Colors.white,
                  backgroundImage: profileImage != null &&
                      profileImage!.isNotEmpty
                      ? NetworkImage(profileImage!)
                      : null,
                  child: profileImage == null || profileImage!.isEmpty
                      ? Icon(Icons.person, size: 30.sp, color: Colors.grey)
                      : null,
                ),
              ),

              SizedBox(width: 14.w),

              /// 🔥 TEXT SECTION
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Text(
                      userName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      "Continue your learning journey",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),

              /// 🔥 OPTIONAL ACTION (NOTIFICATION / PROFILE BTN)
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}