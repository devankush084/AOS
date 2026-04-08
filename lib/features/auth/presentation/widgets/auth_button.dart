import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;

  const AuthButton({
    super.key,
    required this.title,
    required this.onTap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Text(
            title,
            style: TextStyle(
              color: Color(0xFF6A5AE0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}