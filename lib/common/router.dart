import 'dart:async';

import 'package:exo_post/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenPaths {
  ScreenPaths._();

  static String splash = '/';
  static String postPage = '/post';
  static String authPage = '/login';
  static String registerPage = '/register';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: ScreenPaths.splash,
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (context, state) => Container(),
  redirect: _redirect,
  routes: [
    GoRoute(
      path: ScreenPaths.splash,
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);

FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {}
