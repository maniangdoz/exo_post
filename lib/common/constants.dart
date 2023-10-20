//value don't change
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
}
