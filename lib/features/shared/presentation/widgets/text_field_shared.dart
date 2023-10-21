import 'package:exo_post/common/styles/colors.dart';
import 'package:flutter/material.dart';

class TextFieldShared extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final String typeText;
  final int? maxLines;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;

  const TextFieldShared({
    Key? key,
    required this.controller,
    required this.icon,
    required this.labelText,
    required this.typeText,
    required this.maxLines,
    this.validator, this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: typeText == "Password" ? true : false,
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: AppColors.greyColor),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          icon,
          color: AppColors.primaryColor,
        ),
        suffixIcon: suffixIcon,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.scaffoldBackgroundColorLight,
          ),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: AppColors.greyColor),
        errorStyle: const TextStyle(color: AppColors.errorColor),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.errorColor)),
      ),
      validator: validator,
      keyboardType:
          typeText == "Email" ? TextInputType.emailAddress : TextInputType.text,
    );
  }
}
