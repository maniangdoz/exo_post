import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:readmore/readmore.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../shared/presentation/widgets/avatar_user.dart';

class PostCard extends StatefulWidget {
  final int index;
  final String type;
  final String authorname;
  final int authorid;
  final int postid;
  final int postcreatedat;
  final String content;
  final String? urlimage;
  final double widthimage;
  final double heightimage;
  final int commentscount;
  final VoidCallback? onClick;

  const PostCard({
    Key? key,
    required this.type,
    required this.index,
    required this.authorid,
    required this.postid,
    required this.onClick,
    required this.authorname,
    required this.postcreatedat,
    required this.content,
    this.urlimage,
    required this.widthimage,
    required this.heightimage,
    required this.commentscount,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isSkeletonEnabled = true;

  @override
  void initState() {
    super.initState();
    if (widget.urlimage == null) {
      isSkeletonEnabled = false;
    }
  }

  @override
  void didUpdateWidget(covariant PostCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.urlimage != oldWidget.urlimage) {
      setState(() {
        isSkeletonEnabled = widget.urlimage != null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isSkeletonEnabled,
      child: Card(
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
                        onPressed: () => _buildDetailPost(widget.postid),
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
        subtitle: Text(
          AppUtils.formatTimeFromNow(widget.postcreatedat),
        ),
        leading: AvatarUser(name: name, color: color),
      );
    } else {
      return Container(
        padding:
            const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
        child: Text(
          AppUtils.formatTimeFromNow(widget.postcreatedat),
          style: Theme.of(context).textTheme.displaySmall,
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
    if (widget.urlimage != null) {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            builder: (context) => SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PhotoView(
                imageProvider: NetworkImage('${widget.urlimage}'),
              ),
            ),
          );
        },
        child: Container(
          constraints: const BoxConstraints(
              minHeight: 300, minWidth: double.infinity, maxHeight: 500),
          child: Image.network(
            '${widget.urlimage}',
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                Future.delayed(Duration.zero, () {
                  if (mounted) {
                    setState(() {
                      isSkeletonEnabled = false;
                    });
                  }
                });
                return child;
              } else {
                if (loadingProgress.cumulativeBytesLoaded ==
                    loadingProgress.expectedTotalBytes) {
                  Future.delayed(Duration.zero, () {
                    if (mounted) {
                      setState(() {
                        isSkeletonEnabled = false;
                      });
                    }
                  });
                } else {
                  Future.delayed(Duration.zero, () {
                    if (mounted) {
                      setState(() {
                        isSkeletonEnabled = true;
                      });
                    }
                  });
                }
                return Container();
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
