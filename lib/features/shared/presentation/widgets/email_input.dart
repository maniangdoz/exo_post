import 'package:flutter/material.dart';

import '../../../../common/utils/app_validator.dart';
import 'text_field_shared.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
    required TextEditingController emailTextFieldController,
  }) : _emailTextFieldController = emailTextFieldController;

  final TextEditingController _emailTextFieldController;

  @override
  Widget build(BuildContext context) {
    return TextFieldShared(
      controller: _emailTextFieldController,
      icon: Icons.email,
      labelText: "Email",
      typeText: "Email",
      maxLines: 1,
      validator: AppValidors.emailValidtor,
    );
  }
}
