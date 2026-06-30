import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starlog_mobile/core/widgets/bottom_navigation_bar.dart';
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
    StatefulShellRoute.indexedStack(
      pageBuilder: (context, state, navigationShell) => CustomTransitionPage(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: navigationShell,
          bottomNavigationBar: StarlogBottomNavBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) => navigationShell.goBranch(index),
          ),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
        transitionDuration: const Duration(milliseconds: 300),
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/main', builder: (_, _) => const StarlogMain()),
          ],
        ),
      ],
    ),
  ],
);
