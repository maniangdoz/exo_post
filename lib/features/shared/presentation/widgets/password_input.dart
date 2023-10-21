import 'package:flutter/material.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_validator.dart';
import 'text_field_shared.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
    required TextEditingController passwordTextFieldController,
  }) : _passwordTextFieldController = passwordTextFieldController;

  final TextEditingController _passwordTextFieldController;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool hideText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldShared(
      controller: widget._passwordTextFieldController,
      icon: Icons.vpn_key,
      labelText: "Password",
      typeText: hideText ? "Password" : "",
      maxLines: 1,
      validator: AppValidors.passwordValidtor,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            hideText = !hideText;
          });
        },
        icon: Icon(
          hideText ? Icons.visibility_rounded : Icons.visibility_off_rounded,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
