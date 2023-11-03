import 'package:flutter/material.dart';

import '../../../../common/utils/app_utils.dart';
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
                      "${AppUtils.generateAcronym('sender name')}'s posts",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const TotalComment(nbcomments: 1),
                  ],
                ),
              ),
              PostCard(
                type: 'profil',
                onClick: () => {},
                authorname: 'Winnie',
                postcreatedat: 1697401556595,
                content: 'Hello world',
                commentscount: 3,
                urlimage: 'null',
                widthimage: 50,
                heightimage: 1290,
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
