import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:flutter/material.dart';

class AvatarUser extends StatefulWidget {
  const AvatarUser({super.key, required this.name, required this.color});
  final String name;
  final Color color;
  
  @override
  State<AvatarUser> createState() => _AvatarUserState();
}

class _AvatarUserState extends State<AvatarUser> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: widget.color,
      child: Text(
        AppUtils.generateAcronym(widget.name),
        style: TextStyle(
          color: AppUtils.isDarkMode(context)
              ? AppColors.accentColor
              : AppColors.scaffoldBackgroundColorDark,
        ),
      ),
    );
  }
}
