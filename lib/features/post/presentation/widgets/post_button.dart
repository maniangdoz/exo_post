import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  const PostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.camera_alt_rounded,
          color: AppUtils.isDarkMode(context)
              ? AppColors.onPrimaryColor
              : AppColors.primaryColor),
      label: Text(
        'Add post',
        style: TextStyle(
          color: AppUtils.isDarkMode(context)
              ? AppColors.onPrimaryColor
              : AppColors.primaryColor,
        ),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
