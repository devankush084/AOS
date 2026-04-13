import 'package:aos/Core/constants/app_dimensions.dart';
import 'package:aos/config/theme/color_scheme.dart';
import 'package:aos/features/ai/presentation/screens/ai_chat_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class RippleIconButton extends StatefulWidget {
  @override
  _RippleIconButtonState createState() => _RippleIconButtonState();
}

class _RippleIconButtonState extends State<RippleIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildRipple(double delay) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = (_controller.value + delay) % 1;

        return Container(
          width: 120 * value, // increase for bigger ripple
          height: 120 * value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blue.withOpacity(1 - value),
              width: 2,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildRipple(0.0),
            buildRipple(0.3),
            buildRipple(0.6),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.chatMessageColor,
              ),
              child: IconButton(
                icon: const Icon(Icons.chat, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AiChatScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}