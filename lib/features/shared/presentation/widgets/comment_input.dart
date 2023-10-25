import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:exo_post/common/utils/app_validator.dart';
import 'package:exo_post/features/shared/presentation/widgets/text_field_shared.dart';
import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      decoration: BoxDecoration(
          color: AppUtils.isDarkMode(context)
              ? AppColors.scaffoldBackgroundColorDark
              : AppColors.scaffoldBackgroundColorLight,
          borderRadius: BorderRadius.circular(10)),
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
