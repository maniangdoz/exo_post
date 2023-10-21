import 'package:flutter/material.dart';

import '../../../../common/utils/app_validator.dart';
import 'text_field_shared.dart';

class NameInput extends StatelessWidget {
  const NameInput({
    super.key,
    required TextEditingController nameTextFieldController,
  }) : _nameTextFieldController = nameTextFieldController;

  final TextEditingController _nameTextFieldController;

  @override
  Widget build(BuildContext context) {
    return TextFieldShared(
      controller: _nameTextFieldController,
      icon: Icons.person,
      labelText: "Name",
      typeText: "Text",
      maxLines: 1,
      validator: AppValidors.nameValidtor,
    );
  }
}
