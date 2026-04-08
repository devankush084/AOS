import 'package:aos/Core/constants/app_images.dart';
import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/reset_password_provider.dart';

class ResetPasswordScreen extends ConsumerWidget {
  ResetPasswordScreen({super.key});

  final password = TextEditingController();
  final confirm = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    final state = ref.watch(resetPasswordProvider);

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
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                SizedBox(height: isTablet ? 20 : 10),


                Image.asset(
                 AppImages.resetpassword,
                  height: isTablet ? 210 : 310,
                ),

                SizedBox(height: isTablet ? 20 : 10),

                /// 🔥 TITLE
                const Text(
                  "Reset Your Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: isTablet ? 30 : 20),

                /// 🔥 FORM
                Expanded(
                  child: isTablet
                      ? _tablet(context, ref, state)
                      : _mobile(context, ref, state),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 📱 MOBILE
  Widget _mobile(BuildContext context, WidgetRef ref, dynamic state) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: _form(context, ref, state, false),
    );
  }

  Widget _tablet(BuildContext context, WidgetRef ref, dynamic state) {
    return Center(
      child: SizedBox(
        width: 450,
        child: _form(context, ref, state, true),
      ),
    );
  }

  Widget _form(
      BuildContext context,
      WidgetRef ref,
      dynamic state,
      bool isTablet,
      ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        _field(
          hint: "Enter your new password",
          controller: password,
          obscure: state.obscurePassword,
          error: state.passwordError,
          onToggle: () =>
              ref.read(resetPasswordProvider.notifier).togglePassword(),
        ),

        SizedBox(height: isTablet ? 20 : 12),

        _field(
          hint: "Confirm your password",
          controller: confirm,
          obscure: state.obscureConfirm,
          error: state.confirmPasswordError,
          onToggle: () =>
              ref.read(resetPasswordProvider.notifier).toggleConfirm(),
        ),

        SizedBox(height: isTablet ? 25 : 20),

        InkWell(
          onTap: () {
            ref.read(resetPasswordProvider.notifier).submit(
              password.text,
              confirm.text,
            );
            Navigator.pushNamed(context, AppNames.ResetSuccessScreen);
          },
          child: Container(
            height: isTablet ? 60 : 55,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF5F2EEA),
                  Color(0xFF7B61FF),
                ],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: state.isLoading
                  ? const CircularProgressIndicator(
                  color: Colors.white)
                  : const Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        /// 🔥 CANCEL
        SizedBox(
          width:  double.infinity,
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              minimumSize: Size(
                double.infinity,
                isTablet ? 55 : 50,
              ),

              /// ❌ REMOVE backgroundColor
              // backgroundColor: Colors.white,

              /// ✅ Border only
              side: const BorderSide(
                color: Color(0xFFBDBDBD), // soft grey border
                width: 1.5,
              ),

              /// ✅ Rounded
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),

              /// ✅ Transparent background
              backgroundColor: Colors.transparent,

              /// ✅ Remove shadow feel
              elevation: 0,
            ),
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Colors.white, // 🔥 IMPORTANT (matches UI)
                fontSize: isTablet ? 18 : 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }

  /// 🔥 FIELD
  Widget _field({
    required String hint,
    required TextEditingController controller,
    required bool obscure,
    String? error,
    required VoidCallback onToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        errorText: error,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: onToggle,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}