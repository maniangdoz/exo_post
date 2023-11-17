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

  static const String baseUrlDev = 'xoc1-kd2t-7p9b.n7c.xano.io';
  static const String baseUrlProd = 'xoc1-kd2t-7p9b.n7c.xano.io';
  static const String baseUrlImage =
      'https://storage.googleapis.com/xoc1-kd2t-7p9b.n7c.xano.io';
      
  static const String messageError401 =
      'Please log in before you can perform this action.';
}

enum Status {
  waiting,
  succeded,
  failed,
}
