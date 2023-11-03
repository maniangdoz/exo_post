import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/constants.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../shared/presentation/widgets/avatar_user.dart';

class PostCard extends StatefulWidget {
  final String type;
  final String authorname;
  final String postcreatedat;
  final String content;
  final String urlimage;
  final double widthimage;
  final double heightimage;
  final int commentscount;
  final VoidCallback? onClick;

  const PostCard({
    Key? key,
    required this.type,
    required this.onClick,
    required this.authorname,
    required this.postcreatedat,
    required this.content,
    required this.urlimage,
    required this.widthimage,
    required this.heightimage,
    required this.commentscount,
  }) : super(key: key);

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
            _buildHeaderCard(widget.authorname),
            _buildImageCard(),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
              child: _buildCommentCard(widget.content),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: GestureDetector(
                        onTap: () => _editPost(),
                        child: const Text('Edit'),
                      ),
                    ),
                    const SizedBox(width: 25),
                    GestureDetector(
                      onTap: _removePost,
                      child: const Text('Remove'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => _buildDetailPost(1),
                      icon: const Icon(Icons.mode_comment_outlined),
                    ),
                    Text(widget.commentscount.toString()),
                    const SizedBox(width: 10),
                  ],
                ),
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
        subtitle: Text(widget.postcreatedat.toString()),
        leading: AvatarUser(name: name, color: color),
      );
    } else {
      return Container(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 5),
        child: Text(
          widget.postcreatedat.toString(),
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

  Widget _buildImageCard() {
    if (widget.urlimage != 'null') {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            builder: (context) => SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PhotoView(
                imageProvider: NetworkImage(
                    '${AppConstants.baseUrlImage}${widget.urlimage}'),
              ),
            ),
          );
        },
        child: Container(
          constraints: const BoxConstraints(
              minHeight: 300, minWidth: double.infinity, maxHeight: 500),
          child: Image.network(
            '${AppConstants.baseUrlImage}${widget.urlimage}',
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  void _editPost() {}

  void _removePost() {}
}
