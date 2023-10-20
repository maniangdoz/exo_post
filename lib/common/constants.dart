//value don't change
import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/styles/sizes.dart';
import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();
  static bool isDarkMode(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  static double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  static double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  static Positioned firstPosition(BuildContext context) => Positioned(
        right: -getSmallDiameter(context) / 3,
        top: -getSmallDiameter(context) / 3,
        child: Container(
          width: AppConstants.getSmallDiameter(context),
          height: AppConstants.getSmallDiameter(context),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.accentColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
      );

  static Positioned secondPosition(BuildContext context, String title) =>
      Positioned(
        left: -AppConstants.getBiglDiameter(context) / 4,
        top: -AppConstants.getBiglDiameter(context) / 4,
        child: Container(
          width: AppConstants.getBiglDiameter(context),
          height: AppConstants.getBiglDiameter(context),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.accentColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: AppSizes.titleLabel,
                  color: AppColors.onPrimaryColor),
            ),
          ),
        ),
      );

  static Positioned thirdPosition(BuildContext context) => Positioned(
        right: -AppConstants.getBiglDiameter(context) / 2,
        bottom: -AppConstants.getBiglDiameter(context) / 2,
        child: Container(
          width: AppConstants.getBiglDiameter(context),
          height: AppConstants.getBiglDiameter(context),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.onPrimaryColor),
        ),
      );

  static void showAlert(BuildContext context, String message, Color color) {
    var snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
