import 'package:aos/Core/utils/app_extension.dart';
import 'package:aos/features/dashboard/presentation/widgets/Notification_widget.dart';
import 'package:aos/features/dashboard/presentation/widgets/learning_progress_widget.dart';
import 'package:aos/features/dashboard/presentation/widgets/my_course_widget.dart';
import 'package:aos/features/dashboard/presentation/widgets/quick_actions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/AiCard.dart';
import '../widgets/CourseCard.dart';
import '../widgets/ProfileHeader.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Container(
      decoration: const BoxDecoration(
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🔥 HEADER
                  /// 🔹 HEADER
                  ProfileHeader(
                    userName: "John Doe",
                    profileImage: "https://i.pravatar.cc/300",
                  ),




                  /// 🔥 AI ASSISTANT
                  Text("AI Assistant")
                      .bold(size: isTablet ? 20 : 16, color: Colors.white),

                  SizedBox(height: size.height * 0.01),

<<<<<<< HEAD
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minHeight: size.height * 0.18,
                        ),
                        width: double.infinity,
                        padding: EdgeInsets.all(size.width * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Ask Yana AI").bold(
                                color: Color(0xFF4E4E4E),
                                size: isTablet ? 20 : 16),
                            SizedBox(height: 6),
                            Text(
                              "Get help with lesson explanations,\nstudy & guidance",
                            ).regular(
                              color: Color(0xFF4E4E4E),
                              size: isTablet ? 16 : 14,
                            ),
                            SizedBox(height: 10),
                            TextButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  Color(0xFF5A41F5),
                                ),
                              ),
                              child: const Text("Ask Ai")
                                  .bold(color: Colors.white, size: 14),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: -size.height * 0.03,
                        child: FractionallySizedBox(
                          widthFactor: 0.4,
                          child: Image.asset(
                            "assets/images/ai_tutor.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
=======
                  AiCard(
                    onTap: () {
                      // Navigate to AI screen
                    },
>>>>>>> 198a8b0 (S1 final work)
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text("Continue Learning")
                      .bold(color: Color(0xFF4E4E4E), size: isTablet ? 20 : 16),

                  Text("Last Course the student opened")
                      .regular(color: Color(0xFF4E4E4E), size: 14),

                  SizedBox(height: size.height * 0.02),

                  CourseCard(
                    title: "Flutter Advanced UI Masterclass",
                    image: "assets/images/Course1.png",
                    progress: 0.8,
                    onTap: () {},
                  ),

                  SizedBox(height: size.height * 0.02),

                  /// 🔥 MY COURSES
                  Text("My Courses")
                      .bold(color: Color(0xFF4E4E4E), size: isTablet ? 20 : 16),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    height: size.height * 0.17,
                    child: MyCoursesSection(),
                  ),

                  SizedBox(height: size.height * 0.02),

                  /// 🔥 LEARNING PROCESS
                  Text("Learning Process")
                      .bold(color: Color(0xFF4E4E4E), size: isTablet ? 20 : 16),

                  SizedBox(height: size.height * 0.01),
                  LearningProgress(),

                  SizedBox(height: size.height * 0.02),

                  /// 🔥 QUICK ACTIONS
                  Text("Quick Actions")
                      .bold(color: Color(0xFF4E4E4E), size: isTablet ? 20 : 16),

                  SizedBox(height: size.height * 0.01),
                  QuickActions(),

                  SizedBox(height: size.height * 0.02),

                  /// 🔥 NOTIFICATION
                  Text("Notification Preview")
                      .bold(color: Color(0xFF4E4E4E), size: isTablet ? 20 : 16),

                  SizedBox(height: size.height * 0.01),
                  NotificationWidget(),

                  /// 🔥 NAV SAFE SPACE
                  SizedBox(height: size.height * 0.12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
