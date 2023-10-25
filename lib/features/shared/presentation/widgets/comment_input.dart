import 'package:flutter/material.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../../common/utils/app_validator.dart';
import 'text_field_shared.dart';

class CommentInput extends StatelessWidget {
  const CommentInput({
    super.key,
    required TextEditingController commentTextFieldController,
  }) : _commentTextFieldController = commentTextFieldController;

  final TextEditingController _commentTextFieldController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: AppUtils.isDarkMode(context)
              ? Colors.black
              : AppColors.onPrimaryColor),
      child: Column(
        children: [
          TextFieldShared(
            controller: _commentTextFieldController,
            labelText: "Add a comment",
            typeText: "TextArea",
            maxLines: 1,
            icon: Icons.mode_comment_outlined,
            validator: AppValidors.commentValidtor,
          ),
        ],
      ),
    );
  }
}
