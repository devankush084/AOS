import 'package:flutter/material.dart';

class AccessDeniedWidget extends StatelessWidget {
  const AccessDeniedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Access Denied",
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }
}