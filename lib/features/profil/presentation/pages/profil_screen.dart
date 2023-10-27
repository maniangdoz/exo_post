import 'package:flutter/material.dart';

import '../../../post/presentation/widgets/post_card.dart';
import '../../../shared/presentation/widgets/info_user.dart';
import '../../../shared/presentation/widgets/total_comment.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "My posts",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const TotalComment(nbcomments: 100),
                  ],
                ),
              ),
              PostCard(
                type: 'profil',
                onClick: () => {},
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
