import 'package:aos/config/routes/route_names.dart';
import 'package:aos/features/auth/presentation/screens/reset_success_screen.dart';
import 'package:aos/features/auth/presentation/screens/welcome_back_screen.dart';
import 'package:flutter/material.dart';


// SCREENS
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/create_pin_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/otp_verification_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import '../../features/auth/presentation/screens/welcome_screen.dart';
import '../../features/dashboard/presentation/widgets/bottom_navigation_bar.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNames.splash:
        return _materialRoute(const SplashScreen());

      case AppNames.onboarding:
        return _materialRoute(OnboardingScreen());

      case AppNames.login:
        return _materialRoute(LoginScreen());

      case AppNames.createPinScreen:
        return _materialRoute(CreatePinScreen());

      case AppNames.forgotPassword:
        return _materialRoute(ForgotPasswordScreen());

      case AppNames.otp:
        return _materialRoute(OTPVerificationScreen());

      case AppNames.resetPassword:
        return _materialRoute(ResetPasswordScreen());

      case AppNames.welcomeBack:
        return _materialRoute(const WelcomeBackScreen());

      case AppNames.welcome:
        return _materialRoute(const WelcomeScreen());
      case AppNames.ResetSuccessScreen:
        return _materialRoute(const ResetSuccessScreen());
      case AppNames.FloatingNavBar2:
        return _materialRoute(const FloatingNavBarPro());
<<<<<<< HEAD
=======

      case AppNames.courseVideoScreen:
        return _materialRoute(const CourseVideoScreen());

      case AppNames.courseModuleScreen:
        return _materialRoute(const CourseModuleScreen());

      case AppNames.courseOverviewScreen:
        return _materialRoute(const CourseOverviewScreen());

      case AppNames.assessmentResultScreen:
        return _materialRoute(const AssessmentResultScreen());

      case AppNames.downloadScreen:
        return _materialRoute(const DownloadScreen());

      case AppNames.notificationScreen:
        return _materialRoute(const NotificationScreen());

      case AppNames.profileScreen:
        return _materialRoute(const ProfileScreen());

      case AppNames.studentDashboard:
        return _materialRoute(const StudentDashboard());

>>>>>>> 198a8b0 (S1 final work)

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