import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants.dart';
import '../../../../common/router.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../shared/presentation/widgets/action_button.dart';
import '../../../shared/presentation/widgets/expandable_fa.dart';
import '../../domain/entities/post_response_entity.dart';
import '../../domain/entities/requests/post_request.dart';
import '../bloc/post_bloc.dart';
import '../widgets/post_add_edit.dart';
import '../widgets/post_button.dart';
import '../widgets/post_card.dart';
import '../widgets/skeleton_post.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool isLoading = true;
  PostResponseEntity? _postResponseEntity;
  @override
  void initState() {
    super.initState();
    context
        .read<PostBloc>()
        .add(const GetAllPosts(repuest: PostRequest(page: 0, perPage: 20)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PostBloc, PostState>(
        listener: (context, state) {
          if (state is GetAllPostsFinished) {
            if (state.status == Status.waiting) {
              setState(() {
                isLoading = true;
              });
            } else if (state.status == Status.succeded) {
              setState(() {
                isLoading = false;
                _postResponseEntity = state.postResponseEntity;
              });
            } else if (state.status == Status.failed) {
              setState(() {
                isLoading = false;
              });
              AppUtils.showAlert(
                  context, state.message ?? '', AppColors.accentColor);
            }
          }
          if (state is RemovePostsFinished) {
            if (state.status == Status.waiting) {
              AppUtils.showLoader(context: context);
            } else {
              Navigator.of(context, rootNavigator: true).pop();
              if (state.status == Status.succeded) {
                AppUtils.showAlert(context, state.message ?? 'Success',
                    AppUtils.accentprimaryColor(context));
              } else if (state.status == Status.failed) {
                AppUtils.showAlert(
                    context, state.message ?? 'Error', AppColors.errorColor);
              }
            }
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            PostButton(onClick: () => _showModalBottomSheet(context)),
            const SizedBox(
              height: 10,
            ),
            _showPostMain(),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
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
        return const PostAddEdit();
      },
    );
  }

  Widget _showPostMain() {
    if (isLoading) {
      return const SkeletonPost();
    } else {
      if (_postResponseEntity != null) {
        return Column(
          children: [
            const SizedBox(height: 10),
            if (_postResponseEntity != null &&
                _postResponseEntity!.items!.isNotEmpty)
              ...List.generate(
                _postResponseEntity!.items!.length,
                (index) => PostCard(
                    key: ValueKey<String>('post_$index'),
                    type: 'post',
                    authorname:
                        _postResponseEntity!.items![index].author!.name!,
                    postcreatedat:
                        _postResponseEntity!.items![index].createdAt!,
                    content: _postResponseEntity!.items![index].content!,
                    commentscount:
                        _postResponseEntity!.items![index].commentsCount!,
                    urlimage: _postResponseEntity!.items![index].image != null
                        ? _postResponseEntity!.items![index].image!.url
                        : null,
                    widthimage: 50,
                    heightimage: 1290,
                    onClick: () => _infoUser(
                        _postResponseEntity!.items![index].author!.id!),
                    authorid: _postResponseEntity!.items![index].author!.id!,
                    postid: _postResponseEntity!.items![index].id!,
                    onClickRemove: () =>
                        _removePost(_postResponseEntity!.items![index].id!)),
              )
            else
              const Center(
                child: Text('No posts'),
              ),
          ],
        );
      } else {
        return const Center(
          child: Text('No posts'),
        );
      }
    }
  }

  void _infoUser(int index) {
    context.go('/home/0/post-user/$index');
  }

  _removePost(int postid) {
    context.read<PostBloc>().add(RemovePosts(postId: postid));
  }
}
