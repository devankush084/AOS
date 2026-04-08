import 'package:aos/Core/constants/router_provider.dart';
import 'package:aos/config/routes/app_router.dart';
import 'package:aos/config/routes/route_names.dart';
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
    );
  }
}