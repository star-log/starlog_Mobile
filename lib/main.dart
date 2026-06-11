import 'package:flutter/material.dart';
import 'package:starlog_mobile/core/router/app_router.dart';
import 'package:starlog_mobile/core/widgets/app_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      builder: (context, child) {
        return AppBackground(child: child!);
      },
    );
  }
}
