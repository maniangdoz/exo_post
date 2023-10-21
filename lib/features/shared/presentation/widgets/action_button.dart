import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:flutter/material.dart';

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: AppUtils.isDarkMode(context)
          ? AppColors.primaryColor
          : AppColors.accentColor,
      elevation: 4,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: AppUtils.isDarkMode(context)
            ? AppColors.accentColor
            : AppColors.primaryColor,
      ),
    );
  }
}
