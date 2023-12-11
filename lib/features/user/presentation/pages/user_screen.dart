import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../post/presentation/widgets/post_card.dart';
import '../../../post/presentation/widgets/skeleton_post.dart';
import '../../../shared/presentation/widgets/horizontal_dash.dart';
import '../../../shared/presentation/widgets/info_user.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/entities/user_post_response_entity.dart';
import '../bloc/user_bloc.dart';

class UserScreen extends StatefulWidget {
  final int iduser;

  const UserScreen({Key? key, required this.iduser}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserPostResponseEntity? _postResponseEntity;
  bool isLoading = true, load = true, loadTop = false;
  int firstLoad = 0;
  int page = 0;
  final ScrollController _scrollController = ScrollController();
  List<PostEntity>? items = [];

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _loadData(page);
  }

  void _loadData(int page) {
    AppUtils.valueUserAuthorId().then((value) => context
        .read<UserBloc>()
        .add(GetAllUserPosts(userId: value, page: page, perPage: 5)));
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
      appBar: AppBar(
        title: const Text('User'),
        centerTitle: true,
      ),
      body: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is GetAllPostState) {
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
                    context,
                    state.message ?? 'Erreur de connexion',
                    AppColors.errorColor);
              }
            }
          },
          child: isLoading
              ? const SkeletonPost()
              : Column(children: [
                  if (widget.iduser > 0)
                    InfoUser(
                      idUser: widget.iduser,
                      type: 'user',
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Posts",
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
                  Expanded(
                    child: ListView(
                      controller: _scrollController,
                      children: [
                        if (loadTop)
                          const Column(children: [
                            SizedBox(height: 20),
                            CircularProgressIndicator()
                          ]),
                        if (_postResponseEntity != null && items!.isNotEmpty)
                          ...List.generate(
                            items?.length ?? 0,
                            (index) => PostCard(
                                key: ValueKey<String>('post_$index'),
                                type: 'user',
                                authorname: 'Send',
                                postcreatedat: items![index].createdAt!,
                                content: items![index].content ?? '',
                                commentscount: items![index].commentsCount!,
                                urlimage: items![index].image?.url,
                                widthimage: 50,
                                heightimage: 1290,
                                onClick: () => {},
                                authorid: widget.iduser,
                                postid: items![index].id!,
                                onClickRemove: () =>
                                    _removePost(items![index].id!)),
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
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  )
                ])),
    );
  }

  _removePost(int postid) {
    // context.read<UserBloc>().add(RemovePosts(postId: postid));
  }
}
