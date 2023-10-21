import 'package:flutter/material.dart';

import '../../../../common/styles/colors.dart';

class AuthRegisterContainer extends StatelessWidget {
  const AuthRegisterContainer({
    super.key, this.children = const [],
  });

  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.onPrimaryColor,
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.fromLTRB(20, 300, 20, 15),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        children: children ?? [],
      ),
    );
  }
}
