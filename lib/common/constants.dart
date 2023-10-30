//value don't change

import 'package:flutter/material.dart';

import 'styles/colors.dart';

class AppConstants {
  AppConstants._();

  static TextStyle? textStyle() {
    return const TextStyle(
      fontSize: 12,
      color: AppColors.greyColor,
    );
  }

  static TextStyle? textWhite() {
    return const TextStyle(
      color: AppColors.onPrimaryColor,
    );
  }

  static const String baseUrlDev = '';
  static const String baseUrlProd = '';
}
