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
                  10,
                  (index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => _infoUser(index),
                        child: AvatarUser(
                            name: '$index Parton',
                            color: AppUtils.blackonprimaryColor(context)),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _textComment('$index Parton',
                                'List item dddddddddd dddddd dddddddddd ddddd ddddddd ddddd dd dd'),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '18 days ago',
                                  style: AppConstants.textStyle(),
                                ),
                                const SizedBox(width: 20),
                                _buttonEdit(
                                    "List item dddddddddd dddddd dddddddddd ddddd ddddddd ddddd dd dd",
                                    index),
                                const SizedBox(width: 15),
                                _buttonDelete(index),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Divider(
                              color: AppUtils.blackonprimaryColor(context),
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
        bottomNavigationBar: _bottomInputText());
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
      onTap: _removeComment,
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
    );
  }
}
