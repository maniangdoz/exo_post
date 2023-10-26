import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class CommentInput extends StatefulWidget {
  const CommentInput({
    super.key,
    required TextEditingController commentTextFieldController,
  }) : _commentTextFieldController = commentTextFieldController;

  final TextEditingController _commentTextFieldController;

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  late ScrollController _scrollController;
  late FocusNode _focus;
  late StreamSubscription<bool> _keyboardSubscription;
  late KeyboardVisibilityController _keyboardVisibilityController;
  bool readOnly = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _focus = FocusNode();
    _keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription =
        _keyboardVisibilityController.onChange.listen((event) {
      setState(() {
        readOnly = !event;
      });
    });
  }

  @override
  void dispose() {
    _focus.dispose();
    _keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (readOnly) {
      _focus.requestFocus();
    }
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Scrollbar(
          controller: _scrollController,
          child: TextFormField(
            onTap: _onTap,
            focusNode: _focus,
            showCursor: true,
            readOnly: readOnly,
            scrollController: _scrollController,
            maxLines: 10,
            minLines: 1,
            controller: widget._commentTextFieldController,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: 'Type a comment...',
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      readOnly = false;
    });
  }
}
