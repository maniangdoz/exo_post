import 'dart:async';
import 'dart:developer';

import 'package:exo_post/main_dev.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/pages/auth_screen.dart';
import '../features/comment/presentation/pages/comment_screen.dart';
import '../features/error/presentation/pages/error_screen.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../features/profil/presentation/pages/profil_screen.dart';
import '../features/register/presentation/pages/register_screen.dart';
import '../features/splash/presentation/pages/splash_screen.dart';
import '../features/user/presentation/pages/user_screen.dart';
import 'utils/app_utils.dart';

class ScreenPaths {
  ScreenPaths._();

  static String splash = '/';
  static String homeScreen = '/home/:index';
  static String commentPage = 'comment/:id';
  static String authPage = '/login';
  static String authPageRegister = 'register';
  static String registerPage = '/register';
  static String profilPage = '/me';
  static String userPostPage = 'post-user/:id';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: ScreenPaths.splash,
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (context, state) {
    log(state.error!.message);
    return const ErrorScreen();
  },
  redirect: _redirect,
  routes: [
    GoRoute(
      path: ScreenPaths.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
        path: ScreenPaths.homeScreen,
        builder: (context, state) {
          final index = state.pathParameters['index'];
          return HomeScreen(index: int.parse(index ?? '0'));
        },
        routes: [
          GoRoute(
              path: ScreenPaths.commentPage,
              builder: (context, state) {
                final index = state.pathParameters['id'];
                return CommentScreen(idpost: int.parse(index ?? '0'));
              }),
          GoRoute(
              path: ScreenPaths.userPostPage,
              builder: (context, state) {
                final index = state.pathParameters['id'];
                return UserScreen(iduser: int.parse(index ?? '0'));
              })
        ]),
    GoRoute(
      path: ScreenPaths.profilPage,
      builder: (context, state) => const ProfilScreen(),
    ),
    GoRoute(
      path: ScreenPaths.authPage,
      builder: (context, state) => const AuthScreen(),
      routes: [
        GoRoute(
          path: ScreenPaths.authPageRegister,
          builder: (context, state) => const RegisterScreen(),
        )
      ],
    ),
  ],
);

FutureOr<String?> _redirect(BuildContext context, GoRouterState state) async {
  String? authToken = sharedPrefs.getString(AppUtils.authTokenKey);
  if (authToken == null && authToken!.isEmpty) {
    return '/register';
  }

  return null;
}
