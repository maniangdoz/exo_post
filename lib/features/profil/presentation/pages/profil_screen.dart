import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../post/presentation/bloc/post_bloc.dart';
import '../../../post/presentation/widgets/post_card.dart';
import '../../../post/presentation/widgets/skeleton_post.dart';
import '../../../shared/presentation/widgets/horizontal_dash.dart';
import '../../../shared/presentation/widgets/info_user.dart';
import '../../domain/entities/requests/user_post_request.dart';
import '../../domain/entities/user_post_entity.dart';
import '../../domain/entities/user_post_response_entity.dart';
import '../bloc/profil_bloc.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  UserPostResponseEntity? _postResponseEntity;
  bool isLoading = true, load = true, loadTop = false;
  int firstLoad = 0;
  int page = 0;
  final ScrollController _scrollController = ScrollController();
  List<UserPostEntity>? items = [];
  int userId = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _loadData(page);
  }

  void _loadData(int page) {
    AppUtils.valueUserAuthorId().then((value) {
      setState(() {
        userId = value;
      });
      context.read<ProfilBloc>().add(GetAllUserPosts(
          repuest: UserPostRequest(userId: userId, page: page, perPage: 5)));
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
      body: BlocListener<ProfilBloc, ProfilState>(
        listener: (context, state) {
          if (state is GetAllUserPostsFinished) {
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
                items?.addAll(state.userPostResponseEntity?.items ?? []);
                items = items?.toSet().toList();
                _postResponseEntity = state.userPostResponseEntity;
              });
            } else if (state.status == Status.failed) {
              setState(() {
                isLoading = false;
                load = false;
              });
              AppUtils.showAlert(
                  context, state.message ?? '', AppColors.accentColor);
            }
          }
        },
        child: isLoading
            ? const SkeletonPost()
            : Stack(
                children: <Widget>[
                  ListView(
                    padding: const EdgeInsets.all(0),
                    controller: _scrollController,
                    children: [
                      if (userId > 0)
                        InfoUser(
                          idUser: userId,
                          type: 'profil',
                        ),
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
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 2),
                                child: HorizontalDash(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (loadTop)
                        const Column(children: [
                          SizedBox(height: 20),
                          CircularProgressIndicator()
                        ]),
                      if (_postResponseEntity != null && items!.isNotEmpty)
                        ...List.generate(
                          items?.length ?? 0,
                          (index) {
                            return PostCard(
                              key: ValueKey<String>('post_$index'),
                              type: 'profil',
                              authorname: 'Send',
                              postcreatedat: items![index].createdAt!,
                              content: items![index].content ?? '',
                              commentscount: items![index].commentsCount!,
                              urlimage: items![index].image?.url,
                              widthimage: 50,
                              heightimage: 1290,
                              onClick: () {},
                              authorid: userId,
                              postid: items![index].id!,
                              onClickRemove: () =>
                                  _removePost(items![index].id!),
                            );
                          },
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
                      const SizedBox(height: 100),
                    ],
                  )
                ],
              ),
      ),
    );
  }

  _removePost(int postid) {
    context.read<PostBloc>().add(RemovePosts(postId: postid));
  }
}
