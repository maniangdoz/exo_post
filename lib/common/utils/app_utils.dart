//method or validator
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../styles/colors.dart';

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
              style: Theme.of(context).textTheme.labelSmall,
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
    final List<String> nameParts = fullName.split(' ');
    final StringBuffer initials = StringBuffer();

    for (int i = 0; i < nameParts.length; i++) {
      final String namePart = nameParts[i];
      if (namePart.isNotEmpty) {
        if (nameParts.length == 1 && namePart.length >= 2) {
          initials.write(namePart.substring(0, 2).toUpperCase());
        } else {
          initials.write(namePart[0].toUpperCase());
        }
      }
    }

    return initials.toString().toUpperCase();
  }

  static Color primaryaccentColor(BuildContext context) {
    return AppUtils.isDarkMode(context)
        ? AppColors.primaryColor
        : AppColors.accentColor;
  }

  static Color accentprimaryColor(BuildContext context) {
    return AppUtils.isDarkMode(context)
        ? AppColors.accentColor
        : AppColors.primaryColor;
  }

  static Color blackonprimaryColor(BuildContext context) {
    return AppUtils.isDarkMode(context)
        ? Colors.black
        : AppColors.onPrimaryColor;
  }

  static Color blackprimaryColor(BuildContext context) {
    return AppUtils.isDarkMode(context) ? Colors.black : AppColors.primaryColor;
  }

  static Color primaryColor(BuildContext context) {
    return AppUtils.isDarkMode(context)
        ? AppColors.onPrimaryColor
        : AppColors.primaryColor;
  }

  static Color onprimarygreyColor(BuildContext context) {
    return AppUtils.isDarkMode(context)
        ? AppColors.onPrimaryColor
        : AppColors.greyColor;
  }

  static void showLoader(
      {required BuildContext context, String? message = 'Loading...'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog.adaptive(
        content: Row(
          children: [
            const CircularProgressIndicator.adaptive(),
            const SizedBox(
              width: 10,
            ),
            Text(message!),
          ],
        ),
      ),
    );
  }

  static String formatTimeFromNow(int timestamp) {
    final DateTime now = DateTime.now();
    final DateTime timestampDate =
        DateTime.fromMillisecondsSinceEpoch(timestamp);

    final Duration difference = now.difference(timestampDate);

    if (difference.inDays > 6) {
      return DateFormat('d MMMM').format(timestampDate);
    } else if (difference.inDays > 0) {
      if (difference.inDays == 1) {
        return '1 day ago';
      } else {
        return '${difference.inDays} days ago';
      }
    } else if (difference.inHours > 0) {
      if (difference.inHours == 1) {
        return '1 hour ago';
      } else {
        return '${difference.inHours} hours ago';
      }
    } else if (difference.inMinutes > 0) {
      if (difference.inMinutes == 1) {
        return '1 minute ago';
      } else {
        return '${difference.inMinutes} minutes ago';
      }
    } else {
      return 'Just now';
    }
  }
}
