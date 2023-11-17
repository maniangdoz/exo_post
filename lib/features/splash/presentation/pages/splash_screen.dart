import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants.dart';
import '../../../../common/utils/app_utils.dart';
import '../bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isApiCallComplete = true;

  @override
  void initState() {
    super.initState();
    _makeApiCall();
  }

  void _makeApiCall() {
    AppUtils.isAuthTokenValid().then((isTokenValid) {
      if (isTokenValid) {
        context.read<SplashBloc>().add(const GetAuth());
      } else {
        Timer(const Duration(seconds: 5), () {
          context.go('/home/0');
        });
        setState(() {
          isApiCallComplete = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: isApiCallComplete ? _buildMainContent() : _buildLoadingScreen(),
    );
  }

  Widget _buildMainContent() {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashFinished) {
          if (state.status != Status.waiting) {
            Timer(const Duration(seconds: 5), () {
              context.go('/home/0');
            });
          }
        }
      },
      child: _buildLoadingScreen(),
    );
  }

  Widget _buildLoadingScreen() {
    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130),
            child: CircleAvatar(
                    backgroundColor: AppUtils.accentprimaryColor(context))
                .animate()
                .slideY(begin: -0.5, end: 0.2, duration: 0.5.seconds)
                .then(delay: 600.milliseconds)
                .slideY(end: -0.3, duration: 0.5.seconds)
                .then(delay: 600.milliseconds)
                .slideY(end: 0.1, duration: 0.5.seconds)
                .then(delay: 1.seconds)
                .scaleXY(end: 20, duration: 2.seconds)
                .then(delay: 2.seconds),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: const FlutterLogo(
            size: 80,
          )
              .animate()
              .fadeIn(delay: 4.seconds, duration: 900.milliseconds)
              .slideX(begin: 3, duration: 0.5.seconds),
        ),
      ],
    );
  }
}
