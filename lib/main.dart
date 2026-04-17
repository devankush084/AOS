import 'package:aos/Core/constants/router_provider.dart';
import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:aos/Core/widgets/network_listener.dart';
import 'package:aos/features/ai/presentation/screens/ai_chat_screen.dart';
import 'package:aos/features/ai/presentation/screens/ai_tutor.dart';
import 'package:aos/features/ai/presentation/screens/chat_page.dart';
import 'package:aos/features/auth/presentation/screens/create_pin_screen.dart';
import 'package:aos/features/auth/presentation/screens/login_screen.dart';
import 'package:aos/features/auth/presentation/screens/onboarding_screen.dart';
import 'package:aos/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:aos/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:aos/features/auth/presentation/screens/splash_screen.dart';
import 'package:aos/features/auth/presentation/screens/welcome_back_screen.dart';
import 'package:aos/features/auth/presentation/screens/welcome_screen.dart';
import 'package:aos/features/courses/presentation/screens/course_detail_screen.dart';
import 'package:aos/features/courses/presentation/screens/course_overview_screen.dart';
import 'package:aos/features/courses/presentation/screens/course_video_screen.dart';
import 'package:aos/features/courses/presentation/screens/my_books_screen.dart';
import 'package:aos/features/dashboard/presentation/widgets/bottom_navigation_bar.dart' hide FloatingNavBar2;
import 'package:aos/features/module/presentation/screens/course_module_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/auth/presentation/screens/otp_verification_screen.dart';
import 'features/dashboard/presentation/widgets/bottom_navigation_bar.dart'; // ✅ ADD THIS

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorKey = ref.watch(routerProvider);


    return ScreenUtilInit(
      designSize: const Size(393, 856),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          //
          // home:OTPVerificationScreen(),




          initialRoute: AppNames.login,
          onGenerateRoute: AppRouter.generateRoute,

          builder: (context, child) {
            return NetworkListener(
              child: child ?? const SizedBox(),
            );
          },
        );
      },
    );
  }
}
///git status
///git add .
///git commit -m "ui: improve login screen"
///git push