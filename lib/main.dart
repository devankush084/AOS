import 'package:aos/Core/constants/router_provider.dart';
import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
import 'package:aos/Core/widgets/network_listener.dart'; // ✅ ADD THIS
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorKey = ref.watch(routerProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: AppNames.splash,
      onGenerateRoute: AppRouter.generateRoute,

      builder: (context, child) {
        return NetworkListener(
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}
///git status
///git add .
///git commit -m "ui: improve login screen"
///git push