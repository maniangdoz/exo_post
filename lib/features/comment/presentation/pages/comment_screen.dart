import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../common/constants.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../shared/presentation/widgets/avatar_user.dart';
import '../../../shared/presentation/widgets/comment_input.dart';
import '../../domain/entities/comment_response_entity.dart';
import '../bloc/comment_bloc.dart';

class CommentScreen extends StatefulWidget {
  final int idpost;
  const CommentScreen({Key? key, required this.idpost}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _commentTextFieldController = TextEditingController();
  final GlobalKey<_CommentScreenState> refreshKey = GlobalKey();
  bool isLoading = true;
  CommentResponseEntity? _commentResponseEntity;
  bool isValidToken = false;
  @override
  void initState() {
    super.initState();
    AppUtils.isAuthTokenValid().then((value) {
      setState(() {
        isValidToken = value;
      });
    });
    context.read<CommentBloc>().add(GetAllCommentByPost(postId: widget.idpost));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comments'),
          centerTitle: true,
        ),
        body: BlocListener<CommentBloc, CommentState>(
          listener: (context, state) {
            if (state is GetAllCommentsFinished) {
              if (state.status == Status.waiting) {
                setState(() {
                  isLoading = true;
                });
              } else if (state.status == Status.succeded) {
                setState(() {
                  isLoading = false;
                  _commentResponseEntity = state.commentResponseEntity;
                });
              } else if (state.status == Status.failed) {
                setState(() {
                  isLoading = false;
                });
                AppUtils.showAlert(
                    context, state.message ?? '', AppColors.accentColor);
              }
            }
            if (state is RemoveCommentsFinished) {
              if (state.status == Status.waiting) {
                AppUtils.showLoader(context: context);
              } else {
                Navigator.of(context, rootNavigator: true).pop();
                if (state.status == Status.succeded) {
                  AppUtils.showAlert(context, state.message ?? 'Success',
                      AppUtils.accentprimaryColor(context));
                  context
                      .read<CommentBloc>()
                      .add(GetAllCommentByPost(postId: widget.idpost));
                } else if (state.status == Status.failed) {
                  AppUtils.showAlert(
                      context, state.message ?? 'Error', AppColors.errorColor);
                }
              }
            }
            if (state is AddCommentFinished) {
              if (state.status == Status.waiting) {
                AppUtils.showLoader(context: context);
              } else {
                Navigator.of(context, rootNavigator: true).pop();
                if (state.status == Status.succeded) {
                  setState(() {
                    _commentTextFieldController.text = '';
                  });
                  context
                      .read<CommentBloc>()
                      .add(GetAllCommentByPost(postId: widget.idpost));
                } else if (state.status == Status.failed) {
                  AppUtils.showAlert(
                      context, state.message ?? 'Error', AppColors.errorColor);
                }
              }
            }
          },
          child: Skeletonizer(
            enabled: isLoading ? true : false,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                if (_commentResponseEntity != null &&
                    _commentResponseEntity!.comments!.isNotEmpty)
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: List.generate(
                        _commentResponseEntity!.comments!.length,
                        (index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _avatarUser(
                                _commentResponseEntity!.author!.id!,
                                _commentResponseEntity!
                                    .comments![index].author!.name!),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  _textComment(
                                      _commentResponseEntity!
                                          .comments![index].author!.name!,
                                      _commentResponseEntity!
                                          .comments![index].content!),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: _actionButton(
                                        _commentResponseEntity!
                                            .comments![index].createdAt!,
                                        _commentResponseEntity!
                                            .comments![index].content!,
                                        _commentResponseEntity!
                                            .comments![index].id!,
                                        _commentResponseEntity!
                                            .comments![index].author!.id),
                                  ),
                                  const SizedBox(height: 10),
                                  Divider(
                                      color: AppUtils.blackonprimaryColor(
                                          context)),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  const Center(
                    child: Text('No comments'),
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _bottomInputText());
  }

  List<Widget> _actionButton(createdAt, content, id, author) {
    return <Widget>[
      Text(
        AppUtils.formatTimeFromNow(createdAt),
        style: AppConstants.textStyle(),
      ),
      const SizedBox(width: 20),
      FutureBuilder<bool>(
        future: _autherCommentVerify(author),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData &&
              snapshot.data == true &&
              isValidToken) {
            return Row(
              children: [
                _buttonEdit(content, id),
                const SizedBox(width: 15),
                _buttonDelete(id),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    ];
  }

  Future<bool> _autherCommentVerify(int id) async {
    int res = await AppUtils.valueUserAuthorId();
    return res > 0 && res == id;
  }

  Widget _avatarUser(id, name) {
    return GestureDetector(
      onTap: () => _infoUser(id),
      child:
          AvatarUser(name: name, color: AppUtils.primaryaccentColor(context)),
    );
  }

  void _editComment(String text) {
    if (_formKey.currentState!.validate()) {
      _commentTextFieldController.text = text;
    }
  }

  void _removeComment(int commentId) {
    context.read<CommentBloc>().add(RemoveComments(commentId: commentId));
  }

  void _addComment() {
    if (_formKey.currentState!.validate()) {
      String content = _commentTextFieldController.text.toString().trim();

      AppUtils.isAuthTokenValid().then((value) => {
            if (value)
              context
                  .read<CommentBloc>()
                  .add(AddComment(content: content, postId: widget.idpost))
            else
              AppUtils.showAlert(
                  context, AppConstants.messageError401, AppColors.errorColor)
          });
    }
  }

  void _infoUser(int index) {
    context.go('/home/0/post-user/$index');
  }

  Widget _buttonEdit(String text, int index) {
    return GestureDetector(
      onTap: () => _editComment(' $text'),
      child: Text(
        'Edit',
        style: AppConstants.textStyle(),
      ),
    );
  }

  Widget _buttonDelete(int index) {
    return GestureDetector(
      onTap: () => _removeComment(index),
      child: Text(
        'Remove',
        style: AppConstants.textStyle(),
      ),
    );
  }

  Widget _textComment(String username, String message) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyLarge,
              children: <TextSpan>[
                TextSpan(
                  text: username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' $message',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonSendMessage() {
    return GestureDetector(
      onTap: _addComment,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 2.5),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.send_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomInputText() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            bottom: 15,
          ),
          child: Form(
            key: _formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: CommentInput(
                    commentTextFieldController: _commentTextFieldController,
                  ),
                ),
                _buttonSendMessage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
