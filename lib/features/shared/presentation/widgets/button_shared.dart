import 'package:flutter/material.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/styles/sizes.dart';

class ButtonShared extends StatelessWidget {
  final String text;
  final Color colorButton;
  final VoidCallback? onClick;
  const ButtonShared(
      {Key? key,
      required this.text,
      required this.colorButton,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.heightButton,
      child: TextButton(
        onPressed: onClick,
        style: TextButton.styleFrom(
          backgroundColor: colorButton,
          foregroundColor: AppColors.onPrimaryColor,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
