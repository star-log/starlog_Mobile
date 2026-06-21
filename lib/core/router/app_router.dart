import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starlog_mobile/features/main/presentation/view/main_view.dart';
import 'package:starlog_mobile/features/on_boarding/presentation/on_boarding_view.dart';
import 'package:starlog_mobile/features/splash/presentation/splash.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const StarlogSplash(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 100),
      ),
    ),
    GoRoute(
      path: '/onBoarding',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const OnBoardingView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 100),
      ),
    ),
  ],
);