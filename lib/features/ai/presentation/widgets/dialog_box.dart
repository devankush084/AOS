import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';

class OptionContainer extends StatelessWidget {
  final VoidCallback onCopy;
  final VoidCallback onEdit;

  const OptionContainer({
    super.key,
    required this.onCopy,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.chipBackground.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: onCopy,
            icon: const Icon(Icons.copy),
          ),
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}