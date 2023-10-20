import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child: CircleAvatar(
                      backgroundColor: AppUtils.isDarkMode(context)
                          ? AppColors.accentColor
                          : AppColors.primaryColor)
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
      ),
    );
  }
}
