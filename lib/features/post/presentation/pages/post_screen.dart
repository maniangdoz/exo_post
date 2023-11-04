import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants.dart';
import '../../../../common/router.dart';
import '../../../shared/presentation/widgets/action_button.dart';
import '../../../shared/presentation/widgets/expandable_fa.dart';
import '../../domain/entities/post_response_entity.dart';
import '../../domain/entities/requests/post_request.dart';
import '../bloc/post_bloc.dart';
import '../widgets/post_add.dart';
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
        return const PostAdd();
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
            ...List.generate(
              _postResponseEntity!.items!.length,
              (index) => PostCard(
                type: 'post',
                authorname: _postResponseEntity!.items![index].author!.name!,
                postcreatedat: _postResponseEntity!.items![index].createdAt!,
                content: _postResponseEntity!.items![index].content!,
                commentscount:
                    _postResponseEntity!.items![index].commentsCount!,
                urlimage: _postResponseEntity!.items![index].image != null
                    ? _postResponseEntity!.items![index].image!.url
                    : null,
                widthimage: 50,
                heightimage: 1290,
                onClick: () => _infoUser(1),
              ),
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
}
