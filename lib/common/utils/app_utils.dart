//method or validator
import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/styles/sizes.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static bool regex(String value) => !RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
      .hasMatch(value);

  static Positioned firstPosition(BuildContext context) => Positioned(
        right: -getSmallDiameter(context) / 3,
        top: -getSmallDiameter(context) / 3,
        child: Container(
          width: getSmallDiameter(context),
          height: getSmallDiameter(context),
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
        left: -getBiglDiameter(context) / 4,
        top: -getBiglDiameter(context) / 4,
        child: Container(
          width: getBiglDiameter(context),
          height: getBiglDiameter(context),
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
        right: -getBiglDiameter(context) / 2,
        bottom: -getBiglDiameter(context) / 2,
        child: Container(
          width: getBiglDiameter(context),
          height: getBiglDiameter(context),
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

  static bool isDarkMode(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  static double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;

  static double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  static String generateAcronym(String fullName) {
    var nameParts = fullName.split(' ');
    var acronym = '';
    for (var part in nameParts) {
      if (part.isNotEmpty) {
        acronym += part[0];
      }
      if (acronym.length >= 2) {
        break;
      }
    }
    return acronym.toUpperCase();
  }
}
