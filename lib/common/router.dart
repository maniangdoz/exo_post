import 'dart:async';
import 'dart:developer';

import 'package:exo_post/features/auth/presentation/pages/auth_screen.dart';
import 'package:exo_post/features/detail_post/presentation/pages/detail_post_screen.dart';
import 'package:exo_post/features/error/presentation/pages/error_screen.dart';
import 'package:exo_post/features/post/presentation/pages/post_screen.dart';
import 'package:exo_post/features/profil/presentation/pages/profil_screen.dart';
import 'package:exo_post/features/register/presentation/pages/register_screen.dart';
import 'package:exo_post/features/splash/presentation/pages/splash_screen.dart';
import 'package:exo_post/features/user/presentation/pages/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/pages/home_screen.dart';

class ScreenPaths {
  ScreenPaths._();

  static String splash = '/';
  static String homeScreen = '/home/:index';
  static String postPage = '/post';
  static String detailPostPage = 'post-detail/:id';
  static String authPage = '/login';
  static String authPageRegister = 'register';
  static String registerPage = '/register';
  static String profilPage = '/me';
  static String userPostPage = 'post-user/:id';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/home/1',
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
    ),
    GoRoute(
        path: ScreenPaths.postPage,
        builder: (context, state) => const PostScreen(),
        routes: [
          GoRoute(
            path: ScreenPaths.detailPostPage,
            builder: (context, state) => const DetailPostScreen(),
          ),
          GoRoute(
            path: ScreenPaths.userPostPage,
            builder: (context, state) => const UserScreen(),
          ),
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

FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {}
