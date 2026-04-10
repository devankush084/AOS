import 'package:aos/Core/constants/router_provider.dart';
import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:aos/Core/widgets/network_listener.dart';
import 'package:aos/features/ai/presentation/screens/ai_chat_screen.dart';
import 'package:aos/features/ai/presentation/screens/ai_tutor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ✅ ADD THIS

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
          home: const AiChatScreen(),

          // initialRoute: AppNames.splash,
          // onGenerateRoute: AppRouter.generateRoute,

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