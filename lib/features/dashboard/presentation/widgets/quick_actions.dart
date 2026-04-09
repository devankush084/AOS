import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

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
    );
  }

  // 🔹 Reusable Widget
  Widget _buildItem(FaIconData icon, double boxSize, double iconSize) {
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
        ),
      ),
    );
  }
}