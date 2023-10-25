import 'package:exo_post/common/router.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:exo_post/features/shared/presentation/widgets/avatar_user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/styles/colors.dart';

class PostCard extends StatefulWidget {
  final String type;
  const PostCard({Key? key, required this.type}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          AppUtils.isDarkMode(context) ? Colors.black : AppColors.primaryColor,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.type == 'post'
                ? _buildHeaderCard('Sender name')
                : Container(),
            Image.asset(
              'assets/images/connection_failed.png',
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 10),
              child: ReadMoreText(
                "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum",
                trimLines: 2,
                colorClickableText: AppColors.accentColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' more',
                trimExpandedText: ' less',
                textAlign: TextAlign.start,
                moreStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                lessStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => _buildDetailPost(1),
                  icon: const Icon(Icons.mode_comment_outlined),
                ),
                const Text(
                  '12', // Replace with the actual number of comments
                ),
                const SizedBox(width: 10), // Adjust the width as needed
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(String name) {
    Color color = AppUtils.isDarkMode(context)
        ? AppColors.primaryColor
        : AppColors.accentColor;
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 18, right: 18, top: 5),
      title: Text(name),
      subtitle: const Text('time'),
      leading: AvatarUser(name: name, color: color),
    );
  }

  void _buildDetailPost(int id) {
    context.go('/home/0/post-detail/$id');
  }
}
