
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
                ),
                progressColor: Colors.grey.shade300,
                backgroundColor: const Color(0xFF6500E2),
              ),
            ],
          ).paddingAll(10),
        ),


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
        ),
      ],
    );
  }
}