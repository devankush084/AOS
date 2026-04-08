import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/otp_provider.dart';

class OTPVerificationScreen extends ConsumerWidget {
  OTPVerificationScreen({super.key});

  /// ✅ 6 Controllers
  final controllers = List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;

    final state = ref.watch(otpProvider);

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
            child: Column(
              children: [

                /// 🔙 BACK BUTTON
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                SizedBox(height: isTablet ? 20 : 10),

                /// 🔥 IMAGE
                Image.asset(
                  "assets/images/Otp_logo.png",
                  height: isTablet ? 240 : 210,
                ),

                SizedBox(height: isTablet ? 20 : 10),

                /// 🔥 TITLE
                const Text(
                  "Verify Your Email ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Enter the 6-digit verification Code",
                  style: TextStyle(color: Colors.white70),
                ),

                SizedBox(height: isTablet ? 10 : 20),

                Expanded(
                  child: isTablet
                      ? _tabletLayout(context, ref, state)
                      : _mobileLayout(context, ref, state),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 📱 MOBILE
  Widget _mobileLayout(BuildContext context, WidgetRef ref, dynamic state) {
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

  /// 💻 TABLET
  Widget _tabletLayout(BuildContext context, WidgetRef ref, dynamic state) {
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

        Padding(
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 30 : 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              return SizedBox(
                width: isTablet ? 60 : 45,
                child: TextField(
                  controller: controllers[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  onChanged: (value) {
                    /// 👉 Move next
                    if (value.isNotEmpty && index < 5) {
                      FocusScope.of(context).nextFocus();
                    }

                    /// 👉 Move back on delete
                    if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus();
                    }

                    /// 👉 Combine OTP
                    String otp =
                    controllers.map((e) => e.text).join();

                    ref.read(otpProvider.notifier).updateOTP(otp);
                  },
                  decoration: InputDecoration(
                    counterText: "",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

        SizedBox(height: isTablet ? 20 : 10),

        /// 🔥 ERROR
        if (state.error != null)
          Text(
            state.error!,
            style: const TextStyle(color: Colors.red),
          ),

        SizedBox(height: isTablet ? 30 : 20),

        /// 🔥 BUTTON
        InkWell(
          onTap: state.isLoading
              ? null
              : () async {
            final success =
            await ref.read(otpProvider.notifier).verifyOTP();

            if (success && context.mounted) {
              Navigator.pushNamed(
                context,
                AppNames.resetPassword,
              );
            }
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
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isTablet ? 18 : 16,
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: isTablet ? 30 : 20),

        /// 🔥 RESEND
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("Didn't you receive code? ", style: TextStyle(
              color: isTablet
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF000000),
              fontWeight: FontWeight.bold,
            ),),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Resend Code",
                style: TextStyle(
                  color: isTablet
                      ? const Color(0xFF01000B)
                      : const Color(0xFF6C63FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}