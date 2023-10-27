import 'package:flutter/material.dart';

import '../../../../common/utils/app_utils.dart';

class HorizontalDash extends StatelessWidget {
  const HorizontalDash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          (constraints.constrainWidth() / 7).floor(),
          (index) => SizedBox(
            height: 3,
            width: 3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppUtils.accentprimaryColor(context),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      );
    });
  }
}
