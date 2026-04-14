import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/features/dashboard/presentation/widgets/Notification_widget.dart';
import 'package:aos/features/dashboard/presentation/widgets/learning_progress_widget.dart';
import 'package:aos/features/dashboard/presentation/widgets/my_course_widget.dart';
import 'package:aos/features/dashboard/presentation/widgets/quick_actions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,

          colors: [
            Color(0xFF7A63F9),
            Color(0xFFD2CAFD),
            Colors.white,
            Color(0xFFC7BFFB),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: FaIcon(FontAwesomeIcons.user),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning John",
                        ).bold(color: Colors.white, size: 18),
                        Text(
                          "Continue your learning journey",
                        ).regular(color: Colors.white, size: 16),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text("AI Assistant").bold(size: 16, color: Colors.white),
                SizedBox(height: 10),

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Ask Yana AI",
                          ).bold(color: Color(0xFF4E4E4E), size: 18),
                          Text(
                            "Get help with lession explanations,\nstudy & guidance",
                          ).regular(color: Color(0xFF4E4E4E),size: 16),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xFF5A41F5),
                              ),
                            ),
                            child: Text(
                              "Ask Ai",
                            ).semiBold(color: Colors.white, size: 14),
                          ),
                        ],
                      ).paddingAll(8),
                    ),
                    Positioned(
                      right: -30,
                      top: -50,

                      child: ClipRRect(
                        child: Image.asset(


                          "assets/images/ai_photo1.png",

                          height: 250,
                          width: 250,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Text(
                  "Continue Learning",
                ).bold(color: Color(0xFF4E4E4E), size: 16),
                Text(
                  "Last Course the student opened",
                ).bold(color: Color(0xFF4E4E4E), size: 14),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 4,

                        offset: Offset(1, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(

                          "assets/images/Course1.png",



                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ).paddingAll(10),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Course Title Learning",
                              ).bold(color: Color(0xFF4E4E4E), size: 14),

                              SizedBox(height: 8),

                              LinearProgressIndicator(
                                value: 0.8,
                                borderRadius: BorderRadius.circular(10),
                                backgroundColor: Colors.grey[300],
                                color: Color(0xFF6500E2),
                                minHeight: 6,
                              ),

                              SizedBox(height: 8),

                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Color(0xFF5A41F5),
                                  ),
                                ),
                                child: Text(
                                  "Resume Learning",
                                ).bold(color: Colors.white, size: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text("My Courses").bold(color: Color(0xFF4E4E4E), size: 16),
                SizedBox(height: 250, child: MyCoursesSection()),

                Text(
                  "Learning Process",
                ).bold(color: Color(0xFF4E4E4E), size: 16),
                SizedBox(height: 10),
                LearningProgress(),
                SizedBox(height: 10),
                Text("Quick Actions").bold(color: Color(0xFF4E4E4E), size: 16),
                SizedBox(height: 10),
                QuickActions(),
                SizedBox(height: 10),
                Text(
                  "Notification Preview",
                ).bold(color: Color(0xFF4E4E4E), size: 16),
                SizedBox(height: 10),


                NotificationWidget(),
                SizedBox(height: 100,)
              ],
            ).paddingSymmetric(vertical: 10, horizontal: 10),
          ),
        ),
      ),
    );
  }
}
