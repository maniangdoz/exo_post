import 'package:exo_post/common/router.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:exo_post/features/post/presentation/widgets/skeleton_post.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/presentation/widgets/action_button.dart';
import '../../../shared/presentation/widgets/expandable_fa.dart';
import '../widgets/post_button.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // AppUtils.firstPosition(context),
          // AppUtils.secondPosition(context, ""),
          // AppUtils.thirdPosition(context),
          ListView(
            padding: const EdgeInsets.all(8),
            children: const [
              PostButton(),
              SizedBox(
                height: 10,
              ),
              SkeletonPost(),
              SizedBox(
                height: 100,
              ),
            ],
          )
        ],
      ),
      floatingActionButton: ExpandableFab(
        distance: 80,
        children: [
          ActionButton(
            onPressed: () => _showAction(context, 0),
            icon: const Icon(Icons.camera_alt_rounded),
          ),
          ActionButton(
            onPressed: () => _showAction(context, 1),
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
    );
  }

  _showAction(BuildContext context, int i) {
    if (i == 0) {
    } else {
      context.go(ScreenPaths.authPage);
    }
  }
}
