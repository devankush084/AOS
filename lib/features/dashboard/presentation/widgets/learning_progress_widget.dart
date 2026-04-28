
import 'package:aos/Core/utils/app_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';



class LearningProgress extends StatefulWidget {
  const LearningProgress({super.key});

  @override
  State<LearningProgress> createState() => _LearningProgressState();
}

class _LearningProgressState extends State<LearningProgress> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Container(
          height: 160,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
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
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Lesson\nCompleted").bold(color: const Color(0xFF4E4E4E), size: 14),

              CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 8.0,
                percent: 0.1,
                center: const Text(
                  "10%",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4E4E4E),
                  ),
=======
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;

        double spacing = 10.w;
        double height = isTablet ? 110.h : 130.h;

        return Row(
          children: [
            Expanded(child: _card(height, _lessonCompleted())),
            SizedBox(width: spacing),
            Expanded(child: _card(height, _lineChart())),
            SizedBox(width: spacing),
            Expanded(child: _card(height, _badges())),
          ],
        );
      },
    );
  }

  /// 🔥 PREMIUM CARD
  Widget _card(double height, Widget child) {
    return Container(
      height: height,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.95),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }

  /// 🔥 CARD 1 - LESSON COMPLETED
  Widget _lessonCompleted() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Lessons",
          style: TextStyle(
            fontSize: 11.sp,
            color: Colors.grey,
          ),
        ),

        SizedBox(height: 4.h),

        Text(
          "Completed",
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E2E2E),
          ),
        ),

        SizedBox(height: 6.h),

        CircularPercentIndicator(
          radius: 22.r,
          lineWidth: 5,
          percent: 0.7,
          center: Text(
            "70%",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10.sp,
            ),
          ),
          progressColor: Color(0xFF5A41F5),
          backgroundColor: Colors.grey.shade200,
          circularStrokeCap: CircularStrokeCap.round,
        ),
      ],
    );
  }

  /// 🔥 CARD 2 - CHART
  Widget _lineChart() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Weekly",
          style: TextStyle(fontSize: 11.sp, color: Colors.grey),
        ),

        SizedBox(height: 4.h),

        Text(
          "Activity",
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 6.h),

        SizedBox(
          height: 45.h,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  color: Color(0xFF5A41F5),
                  barWidth: 3,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF5A41F5).withOpacity(0.3),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  spots: const [
                    FlSpot(0, 2),
                    FlSpot(1, 3),
                    FlSpot(2, 2),
                    FlSpot(3, 4),
                    FlSpot(4, 3),
                    FlSpot(5, 5),
                    FlSpot(6, 4),
                  ],
>>>>>>> 198a8b0 (S1 final work)
                ),
                progressColor: Colors.grey.shade300,
                backgroundColor: const Color(0xFF6500E2),
              ),
            ],
          ).paddingAll(10),
        ),

<<<<<<< HEAD

        Container(
          height: 160,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
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
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Lesson\ncompleted").bold(color: const Color(0xFF4E4E4E), size: 14),

              // Give the chart a fixed height
              SizedBox(
                height: 80,
                width: 100,
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false), // Hide grid for small space
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: false,

                        color:Color(0xFF6500E2),
                        barWidth: 6,
                        dotData: const FlDotData(show: false),
                        spots: const [
                          FlSpot(0, 3),
                          FlSpot(1, 2),
                          FlSpot(2, 4),
                          FlSpot(3, 3),
                          FlSpot(4, 5),
                          FlSpot(5, 2),
                          FlSpot(6, 4),
                          FlSpot(7, 3),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).paddingAll(10),
        ),

        Container(
          height: 160,
          width: 120, // Add fixed width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
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
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Achievement\nbadges").bold(color: const Color(0xFF4E4E4E), size: 14),

              CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 8.0,
                percent: 0.11,
                center: const Text(
                  "11",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4E4E4E),
                  ),
                ),
                progressColor: Colors.grey.shade300,
                backgroundColor: const Color(0xFF6500E2),
              ),
            ],
          ).paddingAll(10),
=======
  /// 🔥 CARD 3 - BADGES
  Widget _badges() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Achievements",
          style: TextStyle(fontSize: 11.sp, color: Colors.grey),
        ),

        SizedBox(height: 4.h),

        Text(
          "Badges",
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 6.h),

        CircularPercentIndicator(
          radius: 22.r,
          lineWidth: 5,
          percent: 0.4,
          center: Text(
            "11",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
            ),
          ),
          progressColor: Color(0xFF5A41F5),
          backgroundColor: Colors.grey.shade200,
          circularStrokeCap: CircularStrokeCap.round,
>>>>>>> 198a8b0 (S1 final work)
        ),
      ],
    );
  }
}