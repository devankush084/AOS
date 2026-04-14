import 'package:flutter/material.dart';

class MyCoursesSection extends StatelessWidget {
  const MyCoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = (screenWidth - 100) / 2.2;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: _CourseItem(
            title: 'Course Learning ${index + 1}',
            progress: [0.5, 0.5, 0.5, 0.75, 0.25][index],
            width: cardWidth,
          ),
        );
      },
    );
  }
}

class _CourseItem extends StatelessWidget {
  final String title;
  final double progress;
  final double width;

  const _CourseItem({
    required this.title,
    required this.progress,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Container(
        constraints: const BoxConstraints(minHeight: 150),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFA8A6A6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ]

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4A6AFF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/Course1.png",
                      fit: BoxFit.cover,
                    ),
                  ),

                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
              ],
            ),




            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Progress"),
            
                const SizedBox(width: 29),
                Text("50%")
              ],
            ),
        const SizedBox(height:10),
            LinearProgressIndicator(
              value: 0.8,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.grey[300],
              color: Color(0xFF6500E2),
              minHeight: 6,
            ),
          ],
        ),
      ),
    );
  }
}