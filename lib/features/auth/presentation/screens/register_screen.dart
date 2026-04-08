import 'package:aos/features/auth/presentation/widgets/auth_background.dart';
import 'package:aos/features/auth/presentation/widgets/auth_button.dart';
import 'package:aos/features/auth/presentation/widgets/auth_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Register",
                style: TextStyle(color: Colors.white, fontSize: 24)),

            AuthForm(email: email, password: password),

            SizedBox(height: 20),
            AuthButton(title: "Create Account", onTap: () {}),
          ],
        ),
      ),
    );
  }
}