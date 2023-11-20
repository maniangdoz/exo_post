import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../common/constants.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../post/presentation/bloc/post_bloc.dart';
import '../../../post/presentation/widgets/post_card.dart';
import '../../../shared/presentation/widgets/horizontal_dash.dart';
import '../../../shared/presentation/widgets/info_user.dart';
import '../../domain/entities/requests/user_post_request.dart';
import '../../domain/entities/user_post_response_entity.dart';
import '../bloc/profil_bloc.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  bool isLoading = true;

  UserPostResponseEntity? _postResponseEntity;
  int userId = 0;

  @override
  void initState() {
    super.initState();
    AppUtils.valueUserAuthorId().then((value) {
      setState(() {
        userId = value;
      });
      context.read<ProfilBloc>().add(GetAllUserPosts(
          repuest: UserPostRequest(userId: value, page: 0, perPage: 20)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  if (_postResponseEntity != null)
                    ...List.generate(
                      _postResponseEntity!.items?.length ?? 0,
                      (index) {
                        final postItem = _postResponseEntity!.items![index];
                        return PostCard(
                          key: ValueKey<String>('post_$index'),
                          type: 'profil',
                          authorname: 'Send',
                          postcreatedat: postItem.createdAt!,
                          content: postItem.content ?? '',
                          commentscount: postItem.commentsCount!,
                          urlimage: postItem.image?.url,
                          widthimage: 50,
                          heightimage: 1290,
                          onClick: () {},
                          authorid: userId,
                          postid: postItem.id!,
                          onClickRemove: () => _removePost(postItem.id!),
                        );
                      },
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
