import 'package:flutter/material.dart';

import '../../../shared/presentation/widgets/action_button.dart';
import '../../../shared/presentation/widgets/expandable_fa.dart';
import '../widgets/post_button.dart';
import '../widgets/post_card.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts App'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          PostButton(),
          SizedBox(
            height: 10,
          ),
          PostCard(),
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

  _showAction(BuildContext context, int i) {}
}
