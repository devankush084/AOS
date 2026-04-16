import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    final state = ref.watch(authProvider);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF7F7AFB)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Image.asset(
                  "assets/images/login_logo.png",
                  height: isTablet ? 270 : 250,
                ),

                SizedBox(height: isTablet ? 0 : 10),
                 Text(
                  "Sign in to your\nAccount",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isTablet ? 21 : 21.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: isTablet ? 20   : 10),
                Expanded(
                  child: isTablet
                      ? Align(
                      alignment: Alignment.bottomCenter,

                      child: _buildTabletLayout(context, ref, state))
                      : _buildMobileLayout(context, ref, state),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildMobileLayout(
      BuildContext context, WidgetRef ref, dynamic state) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: const BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: _formContent(context, ref, state, false), // ✅ FIX
    );
  }
  Widget _buildTabletLayout(
      BuildContext context, WidgetRef ref, dynamic state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Center(
        child: SizedBox(
          width: 500,
          child: _formContent(context, ref, state, true),
        ),
      ),
    );
  }
  Widget _formContent(
    BuildContext context,
    WidgetRef ref,
    dynamic state,
    bool isTablet,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _inputField(
          hint: "Life ID",
          icon: Icons.person,
          controller: email,
          error: state.emailError,
          ref: ref,
        ),

        const SizedBox(height: 15),

        _inputField(
          hint: "Password",
          icon: Icons.key,
          controller: password,
          error: state.passwordError,
          isPassword: true,
          ref: ref,
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: false, onChanged: (_) {}),
                Text(
                  "Remember me",
                  style: TextStyle(
                    color: isTablet
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFF000000),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppNames.forgotPassword,
                );
              },
              child: Text(
                "Forgot Password",
                style: TextStyle(
                  color: isTablet
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF6C63FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),
        Container(
          height: isTablet ? 60 : 55,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF5F2EEA), Color(0xFF7B61FF)],
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {
              ref.read(authProvider.notifier).login(
                    email.text.trim(),
                    password.text.trim(),
                  );
            },
            child: Center(
              child: state.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isTablet ? 18 : 16,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _inputField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    required WidgetRef ref,
    String? error,
    bool isPassword = false,
  }) {
    final state = ref.watch(authProvider);

    return TextField(
      controller: controller,
      obscureText: isPassword ? state.obscurePassword : false,
      onChanged: (_) {
        ref.read(authProvider.notifier).validate(email.text, password.text);
      },
      decoration: InputDecoration(
        hintText: hint,
        errorText: error,
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  state.obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  ref.read(authProvider.notifier).togglePassword();
                },
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
