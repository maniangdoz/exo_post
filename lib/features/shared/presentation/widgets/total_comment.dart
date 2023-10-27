import 'package:flutter/material.dart';

import '../../../../common/utils/app_utils.dart';
import '../../presentation/widgets/horizontal_dash.dart';

class TotalComment extends StatefulWidget {
  final int nbcomments;
  const TotalComment({super.key, required this.nbcomments});

  @override
  State<TotalComment> createState() => _TotalCommentState();
}

class _TotalCommentState extends State<TotalComment> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 2),
              child: HorizontalDash(),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppUtils.accentprimaryColor(context),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 8, left: 8, top: 5, bottom: 5),
              child: Text(
                "${widget.nbcomments} comments",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
