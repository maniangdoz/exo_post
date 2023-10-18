//value don't change
import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();
  static bool isDarkMode(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }
}
