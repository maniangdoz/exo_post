import 'package:flutter/material.dart';

import '../../../post/presentation/widgets/post_card.dart';
import '../../../shared/presentation/widgets/info_user.dart';
import '../../../shared/presentation/widgets/total_comment.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const InfoUser(idUser: 1),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Her Posts",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const TotalComment(nbcomments: 1),
                  ],
                ),
              ),
              PostCard(
                type: 'profil',
                onClick: () => {},
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          )
        ],
      ),
    );
  }
}
