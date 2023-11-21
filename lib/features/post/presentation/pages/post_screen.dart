import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants.dart';
import '../../../../common/router.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../shared/presentation/widgets/action_button.dart';
import '../../../shared/presentation/widgets/expandable_fa.dart';
import '../../domain/entities/post_entity.dart';
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
  bool isLoading = true, load = true, loadTop = false;
  int firstLoad = 0;
  PostResponseEntity? _postResponseEntity;
  int page = 0;
  final ScrollController _scrollController = ScrollController();
  List<PostEntity>? items = [];
  bool isValidToken = false;

  @override
  void initState() {
    super.initState();
    AppUtils.isAuthTokenValid().then((value) {
      setState(() {
        isValidToken = value;
      });
    });
    _scrollController.addListener(_scrollListener);
    _loadData(page);
  }

  void _loadData(int page) {
    AppUtils.isAuthTokenValid().then((isTokenValid) {
      context.read<PostBloc>().add(
            GetAllPosts(repuest: PostRequest(page: page, perPage: 5)),
          );
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        _postResponseEntity!.nextPage != null) {
      setState(() {
        page = _postResponseEntity!.nextPage != null
            ? _postResponseEntity!.nextPage!
            : _postResponseEntity!.prevPage!;
      });
      _loadData(page);
    }
    if (_scrollController.position.pixels <=
        _scrollController.position.minScrollExtent) {
      _executeWhenScrollAtTop();
    }
  }

  void _executeWhenScrollAtTop() {
    setState(() {
      loadTop = true;
    });
    _loadData(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PostBloc, PostState>(
        listener: (context, state) {
          if (state is GetAllPostsFinished) {
            if (state.status == Status.waiting) {
              setState(() {
                isLoading = firstLoad == 0 ? true : false;
                load = loadTop ? false : true;
              });
            } else if (state.status == Status.succeded) {
              setState(() {
                if (loadTop) items?.clear();
                firstLoad++;
                isLoading = false;
                load = false;
                loadTop = false;
                items?.addAll(state.postResponseEntity?.items ?? []);
                items = items?.toSet().toList();
                _postResponseEntity = state.postResponseEntity;
              });
            } else if (state.status == Status.failed) {
              setState(() {
                isLoading = false;
                load = false;
                loadTop = false;
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
                _loadData(0);
              } else if (state.status == Status.failed) {
                AppUtils.showAlert(
                    context, state.message ?? 'Error', AppColors.errorColor);
              }
            }
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(0),
          controller: _scrollController,
          children: [
            PostButton(onClick: () => _showModalBottomSheet(context)),
            const SizedBox(height: 10),
            _showPostMain(),
            const SizedBox(height: 100),
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
            icon: isValidToken
                ? const Icon(Icons.logout_outlined)
                : const Icon(Icons.login_outlined),
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
    AppUtils.isAuthTokenValid().then((value) => {
          if (value)
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              builder: (BuildContext context) {
                return const PostAddEdit();
              },
            )
          else
            AppUtils.showAlert(
                context, AppConstants.messageError401, AppColors.errorColor)
        });
  }

  Widget _showPostMain() {
    if (isLoading) {
      return const SkeletonPost();
    } else {
      if (_postResponseEntity != null) {
        return Column(
          children: [
            if (loadTop)
              const Column(children: [
                SizedBox(height: 20),
                CircularProgressIndicator()
              ]),
            const SizedBox(height: 10),
            if (_postResponseEntity != null && items!.isNotEmpty)
              ...List.generate(
                items!.length,
                (index) => PostCard(
                    key: ValueKey<String>('post_$index'),
                    type: 'post',
                    authorname: items![index].author!.name!,
                    postcreatedat: items![index].createdAt!,
                    content: items![index].content!,
                    commentscount: items![index].commentsCount!,
                    urlimage: items![index].image != null
                        ? items![index].image!.url
                        : null,
                    widthimage: 50,
                    heightimage: 1290,
                    onClick: () => _infoUser(items![index].author!.id!),
                    authorid: items![index].author!.id!,
                    postid: items![index].id!,
                    onClickRemove: () => _removePost(items![index].id!)),
              )
            else if (!load && !loadTop)
              const Center(
                child: Text('No posts'),
              ),
            if (load)
              const Column(children: [
                SizedBox(height: 20),
                CircularProgressIndicator()
              ]),
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
