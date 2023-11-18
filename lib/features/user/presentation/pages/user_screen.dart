import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../common/constants.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../post/presentation/bloc/post_bloc.dart';
import '../../../post/presentation/widgets/post_card.dart';
import '../../../profil/domain/entities/requests/user_post_request.dart';
import '../../../profil/domain/entities/user_post_response_entity.dart';
import '../../../profil/presentation/bloc/profil_bloc.dart';
import '../../../shared/presentation/widgets/horizontal_dash.dart';
import '../../../shared/presentation/widgets/info_user.dart';

class UserScreen extends StatefulWidget {
  final int iduser;

  const UserScreen({Key? key, required this.iduser}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool isLoading = true;

  UserPostResponseEntity? _postResponseEntity;

  @override
  void initState() {
    super.initState();
    context.read<ProfilBloc>().add(GetAllUserPosts(
        repuest: UserPostRequest(userId: widget.iduser, page: 0, perPage: 20)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        centerTitle: true,
      ),
      body: BlocListener<ProfilBloc, ProfilState>(
        listener: (context, state) {
          if (state is GetAllUserPostsFinished) {
            if (state.status == Status.waiting) {
              setState(() {
                isLoading = true;
              });
            } else if (state.status == Status.succeded) {
              setState(() {
                isLoading = false;
                _postResponseEntity = state.userPostResponseEntity;
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
        child: Skeletonizer(
          enabled: isLoading ? true : false,
          child: Stack(
            children: <Widget>[
              ListView(
                padding: const EdgeInsets.all(0),
                children: [
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
                  if (_postResponseEntity != null &&
                      _postResponseEntity!.items!.isNotEmpty)
                    ...List.generate(
                      _postResponseEntity?.items?.length ?? 0,
                      (index) => PostCard(
                          key: ValueKey<String>('post_$index'),
                          type: 'user',
                          authorname: 'Send',
                          postcreatedat:
                              _postResponseEntity!.items![index].createdAt!,
                          content:
                              _postResponseEntity!.items![index].content ?? '',
                          commentscount:
                              _postResponseEntity!.items![index].commentsCount!,
                          urlimage: _postResponseEntity!.items![index].image !=
                                  null
                              ? _postResponseEntity!.items![index].image!.url
                              : null,
                          widthimage: 50,
                          heightimage: 1290,
                          onClick: () => {},
                          authorid: widget.iduser,
                          postid: _postResponseEntity!.items![index].id!,
                          onClickRemove: () => _removePost(
                              _postResponseEntity!.items![index].id!)),
                    )
                  else
                    const Center(
                      child: Text('No posts'),
                    ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _removePost(int postid) {
    context.read<PostBloc>().add(RemovePosts(postId: postid));
  }
}
