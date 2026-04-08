import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/forgot_password_provider.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  ForgotPasswordScreen({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    final state = ref.watch(forgotPasswordProvider);

    return Scaffold(
      body: Stack(
        children: [
          /// 🔥 BACKGROUND
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
              child: SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            /// 🔙 BACK BUTTON
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.white),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),

                            SizedBox(height: isTablet ? 20 : 10),

                            /// 🔥 IMAGE
                            Image.asset(
                              "assets/images/forgot_logo.png",
                              height: isTablet ? 310 : 230,
                            ),

                            SizedBox(height: isTablet ? 0 : 10),

                            /// 🔥 TITLE
                            const Text(
                              "Forgot Your Password\nand Continue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(height: isTablet ? 0 : 20),

                            /// 🔥 FORM SECTION
                            Expanded(
                              child: isTablet
                                  ? _tabletLayout(context, ref, state)
                                  : _mobileLayout(context, ref, state),
                            ),
                          ],
                        ),
                      )))),
        ],
      ),
    );
  }

  /// 📱 MOBILE (CARD UI)
  Widget _mobileLayout(BuildContext context, WidgetRef ref, dynamic state) {
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
      child: _formContent(context, ref, state, false),
    );
  }

  /// 💻 TABLET (CENTER CLEAN UI)
  Widget _tabletLayout(BuildContext context, WidgetRef ref, dynamic state) {
    return Center(
      child: SizedBox(
        width: 450,
        child: _formContent(context, ref, state, true),
      ),
    );
  }

  /// 🔥 COMMON FORM
  Widget _formContent(
    BuildContext context,
    WidgetRef ref,
    dynamic state,
    bool isTablet,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// 🔥 EMAIL FIELD
        TextField(
          controller: emailController,
          onChanged: (_) {
            ref
                .read(forgotPasswordProvider.notifier)
                .validate(emailController.text);
          },
          decoration: InputDecoration(
            hintText: "JohnDoe@gmail.com",
            errorText: state.emailError,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        SizedBox(height: isTablet ? 25 : 20),

        /// 🔥 SUBMIT BUTTON
        InkWell(
          onTap: state.isLoading
              ? null
              : () async {
                  await ref
                      .read(forgotPasswordProvider.notifier)
                      .submit(emailController.text.trim());

                  Navigator.pushNamed(context, AppNames.otp);
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
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                      "Submit Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isTablet ? 18 : 16,
                      ),
                    ),
            ),
          ),
        ),

        SizedBox(height: isTablet ? 25 : 20),

        /// 🔥 BACK
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "← Back to Login",
            style: TextStyle(
              color: isTablet ? const Color(0xFF7F7AFB) : Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
