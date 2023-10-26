import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../shared/presentation/widgets/avatar_user.dart';
import '../../../shared/presentation/widgets/comment_input.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final _commentTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color color =
        AppUtils.isDarkMode(context) ? Colors.black : AppColors.onPrimaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: List.generate(
                20, // Replace this with your actual item count
                (index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _infoUser(index),
                      child: AvatarUser(name: 'Winnie Parton', color: color),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Winnie Parton$index',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const TextSpan(
                                        text:
                                            ' List item dddddddddd dddddd dddddddddd ddddd ddddddd ddddd dd dd',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '18 days ago',
                                style: AppConstants.textStyle(),
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                onTap: () => _editComment(
                                    ' List item dddddddddd dddddd dddddddddd ddddd ddddddd ddddd dd dd'),
                                child: Text(
                                  'Edit',
                                  style: AppConstants.textStyle(),
                                ),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: _removeComment,
                                child: Text(
                                  'Remove',
                                  style: AppConstants.textStyle(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Divider(
                            color: AppUtils.isDarkMode(context)
                                ? Colors.black
                                : AppColors.onPrimaryColor,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
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
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: CommentInput(
                    commentTextFieldController: _commentTextFieldController,
                  ),
                ),
                GestureDetector(
                  onTap: _addComment,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 7, horizontal: 2.5),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _editComment(String text) {
    _commentTextFieldController.text = text;
  }

  void _removeComment() {
    _commentTextFieldController.clear();
  }

  void _addComment() {}

  void _infoUser(int index) {
    context.go('/home/0/post-user/$index');
  }
}
