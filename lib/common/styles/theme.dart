import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3:true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarBackgroundColorLight,
      foregroundColor: AppColors.appBarForegroundColor,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.onPrimaryColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3:true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarBackgroundColorDark,
      foregroundColor: AppColors.appBarForegroundColor,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.onPrimaryColor,
    ),
  );
}
