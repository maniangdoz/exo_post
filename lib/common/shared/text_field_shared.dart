import 'package:exo_post/common/styles/colors.dart';
import 'package:flutter/material.dart';

class TextFieldShared extends StatelessWidget {
  final IconData icon;
  final String labelText;
  const TextFieldShared({Key? key, required this.icon, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: AppColors.primaryColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.scaffoldBackgroundColorLight,
          ),
        ),
        labelText: labelText,
        enabledBorder: InputBorder.none,
        labelStyle: const TextStyle(color: AppColors.greyColor),
      ),
    );
  }
}
