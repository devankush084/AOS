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
                  Row(
                    children: [
                      CircleAvatar(
                        radius:
                            isTablet ? size.width * 0.05 : size.width * 0.08,
                        child: const FaIcon(FontAwesomeIcons.user),
                      ),
                      SizedBox(width: size.width * 0.04),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Good Morning John").bold(
                                color: Colors.white, size: isTablet ? 20 : 16),
                            Text("Continue your learning journey").regular(
                                color: Colors.white, size: isTablet ? 18 : 14),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.02),

                  /// 🔥 AI ASSISTANT
                  Text("AI Assistant")
                      .bold(size: isTablet ? 20 : 16, color: Colors.white),

                  SizedBox(height: size.height * 0.02),

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
                  ),

                  SizedBox(height: size.height * 0.02),

                  Text("Continue Learning")
                      .bold(color: Color(0xFF4E4E4E), size: isTablet ? 20 : 16),

                  Text("Last Course the student opened")
                      .regular(color: Color(0xFF4E4E4E), size: 14),

                  SizedBox(height: size.height * 0.02),

                  Container(
                    padding: EdgeInsets.all(size.width * 0.03),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/Course1.png",
                            width: isTablet
                                ? size.width * 0.15
                                : size.width * 0.25,
                            height: isTablet
                                ? size.height * 0.12
                                : size.height * 0.10,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Course Title Learning")
                                  .bold(color: Color(0xFF4E4E4E), size: 14),
                              SizedBox(height: size.height * 0.01),
                              LinearProgressIndicator(
                                value: 0.8,
                                borderRadius: BorderRadius.circular(10),
                                backgroundColor: Colors.grey[300],
                                color: Color(0xFF6500E2),
                                minHeight: 6,
                              ),
                              SizedBox(height: size.height * 0.01),
                              TextButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Color(0xFF5A41F5),
                                  ),
                                ),
                                child: const Text("Resume Learning")
                                    .bold(color: Colors.white, size: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: size.height * 0.02),

                  /// 🔥 MY COURSES
                  Text("My Courses")
                      .bold(color: Color(0xFF4E4E4E), size: isTablet ? 20 : 16),

                  SizedBox(
                    height: size.height * 0.28,
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
