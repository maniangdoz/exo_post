import 'package:exo_post/common/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/styles/colors.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key, required this.type}) : super(key: key);

  final String type;
  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          AppUtils.isDarkMode(context) ? Colors.black : AppColors.primaryColor,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.type == 'post' ? _buildPostCard() : Container(),
            Image.asset(
              'assets/images/connection_failed.png',
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
              child: ReadMoreText(
                "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                trimLines: 2,
                colorClickableText: AppColors.accentColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'more',
                trimExpandedText: 'less',
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
                  onPressed: () {},
                  icon: const Icon(Icons.mode_comment),
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

  Widget _buildPostCard() {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 18, right: 18, top: 5),
      title: const Text('Sender name'),
      subtitle: const Text('time'),
      leading: CircleAvatar(
        backgroundColor: AppUtils.isDarkMode(context)
            ? AppColors.primaryColor
            : AppColors.accentColor,
        child: Text(
          AppUtils.generateAcronym("Sender name"),
          style: TextStyle(
            color: AppUtils.isDarkMode(context)
                ? AppColors.accentColor
                : AppColors.scaffoldBackgroundColorDark,
          ),
        ),
      ),
    );
  }
}
