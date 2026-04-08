import 'package:flutter/material.dart';
import 'auth_textfield.dart';

class AuthForm extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;

  const AuthForm({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(hint: "Email", controller: email),
        SizedBox(height: 10),
        AuthTextField(
          hint: "Password",
          controller: password,
          isPassword: true,
        ),
      ],
    );
  }
}