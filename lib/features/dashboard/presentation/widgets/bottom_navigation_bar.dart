import 'package:flutter/material.dart';

import '../../../courses/presentation/screens/lesson_player_screen.dart';
/// 🔥 IMPORT YOUR SCREENS
import '../../../dashboard/presentation/screens/dashboard_screen.dart';
import '../../../courses/presentation/screens/course_overview_screen.dart';
import '../../../ai/presentation/screens/ai_tutor.dart';
import '../../../courses/presentation/screens/course_detail_screen.dart';
<<<<<<< HEAD
=======
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
>>>>>>> 198a8b0 (S1 final work)

class FloatingNavBarPro extends StatefulWidget {
  const FloatingNavBarPro({super.key});

  @override
  State<FloatingNavBarPro> createState() => _FloatingNavBarProState();
}

class _FloatingNavBarProState extends State<FloatingNavBarPro> {
  int selectedIndex = 0;

  /// ✅ FIXED PAGES (5 ONLY)
  final List<Widget> pages = [
    StudentDashboard(),   // 0 → Home
    MyBooksScreen(),      // 1 → Courses
    AiTutorScreen(),      // 2 → Chatbot
<<<<<<< HEAD
    CourseDetailScreen(), // 3 → Profile (temp)
    Container(),          // 4 → Settings
=======
    ProfileScreen(), // 3 → Profile (temp)
    SettingsScreen(),          // 4 → Settings
>>>>>>> 198a8b0 (S1 final work)
  ];

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final tablet = isTablet(context);

    final navHeight = tablet ? 85.0 : 70.0;
    final fabSize = tablet ? 75.0 : 65.0;
    final iconSize = tablet ? 26.0 : 22.0;
    final textSize = tablet ? 13.0 : 11.0;

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          /// 🔥 IMPORTANT → NO REBUILD ISSUE
          IndexedStack(
            index: selectedIndex,
            children: pages,
          ),

          /// 🔥 BOTTOM NAVBAR
          Positioned(
            bottom: tablet ? 30 : 20,
            left: tablet ? width * 0.15 : 16,
            right: tablet ? width * 0.15 : 16,
            child: SafeArea(
              child: Container(
                height: navHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 25,
                    ),
                  ],
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    /// 🔹 NAV ITEMS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        navItem(Icons.home_rounded, "Home", 0,
                            iconSize, textSize),
                        navItem(Icons.menu_book_rounded, "Courses", 1,
                            iconSize, textSize),

                        SizedBox(width: fabSize),

                        navItem(Icons.person_rounded, "Profile", 3,
                            iconSize, textSize),
                        navItem(Icons.settings_rounded, "Settings", 4,
                            iconSize, textSize),
                      ],
                    ),

                    /// 🔥 CENTER ANIMATED FAB (CHATBOT)
                    Positioned(
                      top: -(fabSize / 2),
                      left: 0,
                      right: 0,
                      child: Center(
                        child: AnimatedFabButton(
                          size: fabSize,
                          onTap: () {
                            setState(() => selectedIndex = 2);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 NAV ITEM
  Widget navItem(IconData icon, String label, int index,
      double iconSize, double textSize) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: isSelected ? 1.15 : 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color:
              isSelected ? const Color(0xFF6A5AE0) : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: textSize,
                fontWeight:
                isSelected ? FontWeight.bold : FontWeight.w400,
                color:
                isSelected ? const Color(0xFF6A5AE0) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔥 ALEXA STYLE FAB
class AnimatedFabButton extends StatefulWidget {
  final VoidCallback onTap;
  final double size;

  const AnimatedFabButton({
    super.key,
    required this.onTap,
    required this.size,
  });

  @override
  State<AnimatedFabButton> createState() => _AnimatedFabButtonState();
}

class _AnimatedFabButtonState extends State<AnimatedFabButton>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _tapController;

  @override
  void initState() {
    super.initState();

    _pulseController =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);

    _tapController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 150));
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _tapController.dispose();
    super.dispose();
  }

  void _handleTap() async {
    await _tapController.forward();
    await _tapController.reverse();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _pulseController,
        builder: (context, child) {
          double scale = 1 + (_pulseController.value * 0.12);

          return Stack(
            alignment: Alignment.center,
            children: [
              /// 🔥 OUTER WAVE
              Container(
                height: widget.size * 1.8 * scale,
                width: widget.size * 1.8 * scale,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple.withOpacity(0.08),
                ),
              ),

              /// 🔥 INNER WAVE
              Container(
                height: widget.size * 1.4 * scale,
                width: widget.size * 1.4 * scale,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple.withOpacity(0.15),
                ),
              ),

              /// 🔥 MAIN BUTTON
              ScaleTransition(
                scale: Tween(begin: 1.0, end: 0.9).animate(
                  CurvedAnimation(
                    parent: _tapController,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: Container(
                  height: widget.size,
                  width: widget.size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF6A5AE0),
                        Color(0xFF8E7CFF),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.6),
                        blurRadius: 25,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.smart_toy_rounded,
                    color: Colors.white,
                    size: widget.size * 0.45,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}