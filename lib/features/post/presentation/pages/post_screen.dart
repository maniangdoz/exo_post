import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/router.dart';
import '../../../shared/presentation/widgets/action_button.dart';
import '../../../shared/presentation/widgets/expandable_fa.dart';
import '../widgets/post_add.dart';
import '../widgets/post_button.dart';
import '../widgets/post_card.dart';
import '../widgets/skeleton_post.dart';

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
          ListView(
            padding: const EdgeInsets.all(0),
            children: [
              PostButton(onClick: () => _showModalBottomSheet(context)),
              const SizedBox(
                height: 10,
              ),
              const SkeletonPost(),
              PostCard(
                type: 'post',
                onClick: () => _infoUser(1),
              ),
              const SizedBox(
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
      _showModalBottomSheet(context);
    } else {
      context.go(ScreenPaths.authPage);
    }
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return const PostAdd();
      },
    );
  }

  void _infoUser(int index) {
    context.go('/home/0/post-user/$index');
  }
}
