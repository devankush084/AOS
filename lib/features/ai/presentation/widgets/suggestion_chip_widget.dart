import 'package:aos/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:aos/Core/utils/app_extension.dart';

class SuggestionWrap extends StatefulWidget {
  final Function(String text) onSuggestionTap;

  const SuggestionWrap({super.key, required this.onSuggestionTap});

  @override
  State<SuggestionWrap> createState() => _SuggestionWrapState();
}

class _SuggestionWrapState extends State<SuggestionWrap> {
  final List<String> suggestions = [
    "Explain this lesson",
    "Give practice questions",
    "Simplify the concept",
    "Recommend next lesson",
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45, // important for single row
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ActionChip(
              label: Text(
                suggestions[index],
                style: TextStyle(
                  color: isSelected
                      ? Colors.black
                      : AppColors.fontColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),

              backgroundColor: isSelected
                  ? AppColors.chipBackground.withOpacity(0.2)
                  : Colors.transparent,

              side: BorderSide(
                color: isSelected
                    ? AppColors.chipBackground
                    : Colors.grey.shade300, // better than transparent
                width: 1,
              ),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });

                widget.onSuggestionTap(suggestions[index]);
              },
            ),
          );
        },
      ),
    ).paddingSymmetric(vertical: 10,horizontal: 20);
  }
}