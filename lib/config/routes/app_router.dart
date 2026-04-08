import 'package:aos/config/routes/route_names.dart';
import 'package:aos/features/auth/presentation/screens/reset_success_screen.dart';
import 'package:flutter/material.dart';


// SCREENS
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/otp_verification_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import '../../features/auth/presentation/screens/welcome_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNames.splash:
        return _materialRoute(const SplashScreen());

      case AppNames.onboarding:
        return _materialRoute(OnboardingScreen());

      case AppNames.login:
        return _materialRoute(LoginScreen());

      case AppNames.register:
        return _materialRoute(RegisterScreen());

      case AppNames.forgotPassword:
        return _materialRoute(ForgotPasswordScreen());

      case AppNames.otp:
        return _materialRoute(OTPVerificationScreen());

      case AppNames.resetPassword:
        return _materialRoute(ResetPasswordScreen());

      case AppNames.welcome:
        return _materialRoute(const WelcomeScreen());
      case AppNames.ResetSuccessScreen:
        return _materialRoute(const ResetSuccessScreen());

      default:
        return _materialRoute(
          const Scaffold(
            body: Center(child: Text("No Route Found")),
          ),
        );
    }
  }

  static MaterialPageRoute _materialRoute(Widget screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }
}