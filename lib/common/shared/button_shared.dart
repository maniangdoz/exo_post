import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/styles/sizes.dart';
import 'package:flutter/material.dart';

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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorButton,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: AppColors.primaryColor,
            onTap: onClick,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: AppColors.onPrimaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
