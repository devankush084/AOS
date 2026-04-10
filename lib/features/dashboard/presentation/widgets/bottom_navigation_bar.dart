import 'package:aos/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatingNavBar2 extends StatefulWidget {
  const FloatingNavBar2({super.key});

  @override
  State<FloatingNavBar2> createState() => _FloatingNavBar2State();
}

class _FloatingNavBar2State extends State<FloatingNavBar2> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    StudentDashboard(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[selectedIndex],

          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width - 32,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.15),
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildItem(FontAwesomeIcons.solidHouse, "Home", 0),
                    buildItem(FontAwesomeIcons.bookOpen, "Courses", 1),
                    buildItem(FontAwesomeIcons.robot, "Ai Tutor", 2),
                    buildItem(FontAwesomeIcons.user, "Profile", 3),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(FaIconData icon, String label, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: isSelected ? const Color(0xFF5A41F5) : Colors.grey[600],
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? const Color(0xFF5A41F5) : Colors.grey[600],
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
