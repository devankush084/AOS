import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFA8A6A6)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue[100],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.notifications,
                  size: 30,
                  color: Colors.blue,
                ).paddingAll(5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Notification").bold(color: Color(0xFF4E4E4E), size: 16),
                  Text(
                    "Get help with lessons study guidance",
                  ).bold(color: Color(0xFF4E4E4E), size: 14),
                ],
              ),
              Text("1hrs ago").bold(color: Color(0xFF4E4E4E), size: 14),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange[100],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.messenger,
                  size: 30,
                  color: Colors.orange,
                ).paddingAll(5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Notification").bold(color: Color(0xFF4E4E4E), size: 16),
                  Text(
                    "Get help with lessons study guidance",
                  ).bold(color: Color(0xFF4E4E4E), size: 14),
                ],
              ),
              Text("1hrs ago").bold(color: Color(0xFF4E4E4E), size: 14),
            ],
          ),
        ],
      ).paddingAll(10),
    );
  }
}
