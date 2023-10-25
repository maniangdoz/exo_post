import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
    ),
    textTheme: const TextTheme(
        titleSmall: TextStyle(fontSize: 14, color: AppColors.whiteColor),
        headlineMedium: TextStyle(
            color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            color: AppColors.onPrimaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 18, color: AppColors.greyColor),
        displayLarge: TextStyle(
            fontSize: 16,
            color: AppColors.greyColor,
            letterSpacing: 1,
            fontWeight: FontWeight.w500),
        labelSmall: TextStyle(fontSize: 40, color: AppColors.onPrimaryColor)),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.onPrimaryColor,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.primaryColor,
      backgroundColor: Colors.black,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.onPrimaryColor,
    ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(fontSize: 14, color: AppColors.primaryColor),
      headlineMedium: TextStyle(
          color: AppColors.onPrimaryColor, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontSize: 18, color: AppColors.greyColor),
      displayLarge: TextStyle(
          fontSize: 16,
          color: AppColors.greyColor,
          letterSpacing: 1,
          fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 40, color: AppColors.onPrimaryColor),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.primaryColor,
      indicatorColor: AppColors.whiteColor,
      unselectedLabelColor: AppColors.greyColor,
    ),
  );
}
