import 'package:flutter/material.dart';

import '../../../../common/utils/app_utils.dart';

class PostButton extends StatelessWidget {
  final VoidCallback? onClick;
  const PostButton({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton.icon(
        onPressed: onClick,
        icon: Icon(Icons.camera_alt_rounded,
            color: AppUtils.primaryColor(context)),
        label: Text(
          'Add post',
          style: TextStyle(
            color: AppUtils.primaryColor(context),
          ),
        ),
        style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
