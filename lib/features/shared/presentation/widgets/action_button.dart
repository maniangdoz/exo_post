import 'package:flutter/material.dart';

import '../../../../common/utils/app_utils.dart';

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
      color: AppUtils.primaryaccentColor(context),
      elevation: 4,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: AppUtils.accentprimaryColor(context),
      ),
    );
  }
}
