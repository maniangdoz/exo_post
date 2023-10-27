import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../shared/presentation/widgets/avatar_user.dart';

class PostCard extends StatefulWidget {
  final String type;
  final VoidCallback? onClick;
  const PostCard({Key? key, required this.type, required this.onClick})
      : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: AppUtils.blackonprimaryColor(context),
      margin: const EdgeInsets.only(top: 5),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderCard('Sender name'),
            Image.asset(
              'assets/images/connection_failed.png',
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
              child: _buildCommentCard(
                  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum"),
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
    Color color = AppUtils.primaryaccentColor(context);
    if (widget.type == 'post') {
      return ListTile(
        onTap: widget.onClick,
        contentPadding: const EdgeInsets.only(left: 18, right: 18, top: 5),
        title: Text(name),
        subtitle: const Text('1 days ago'),
        leading: AvatarUser(name: name, color: color),
      );
    } else {
      return Container(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 5),
        child: Text(
          '1 days ago',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      );
    }
  }

  void _buildDetailPost(int id) {
    context.go('/home/0/comment/$id');
  }

  Widget _buildCommentCard(String comment) {
    return ReadMoreText(
      comment,
      trimLines: 2,
      colorClickableText: AppColors.accentColor,
      trimMode: TrimMode.Line,
      trimCollapsedText: ' more',
      trimExpandedText: ' less',
      textAlign: TextAlign.start,
      moreStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      lessStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
