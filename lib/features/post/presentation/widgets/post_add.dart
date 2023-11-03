import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/constants.dart';
import '../../../../common/styles/colors.dart';
import '../../../../main_dev.dart';

class PostAdd extends StatefulWidget {
  const PostAdd({super.key});

  @override
  State<PostAdd> createState() => _PostAddState();
}

class _PostAddState extends State<PostAdd> {
  XFile? _pickedFile;
  late ScrollController _scrollController;
  late FocusNode _focus;
  late StreamSubscription<bool> _keyboardSubscription;
  late KeyboardVisibilityController _keyboardVisibilityController;
  late TextEditingController _controller;
  bool readOnly = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _focus = FocusNode();
    _controller = TextEditingController();
    _keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription =
        _keyboardVisibilityController.onChange.listen((event) {
      log('event $event');
      setState(() {
        readOnly = !event;
      });
    });
  }

  Future<void> _getImage() async {
    print("rrrrrrrrrrrrrrrrrrrrrrrrr");
    _pickedFile = await imageLogic.getImage();
    setState(() {});
  }

  @override
  void dispose() {
    _focus.dispose();
    _keyboardSubscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (readOnly) {
      _focus.requestFocus();
    }
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: _pickedFile == null
              ? MediaQuery.of(context).viewInsets.bottom
              : 0,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.close_rounded,
                      size: 20,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextButton.icon(
                    onPressed: _addPost,
                    icon: const Icon(
                      Icons.add_box,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.greyColor,
                      foregroundColor: Colors.white,
                    ),
                    label: const Text(
                      'Add Post',
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                child: TextFormField(
                  controller: _controller,
                  onTap: _textFieldOnTap,
                  focusNode: _focus,
                  showCursor: true,
                  readOnly: readOnly,
                  scrollController: _scrollController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'What\'s news?',
                    hintStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            if (_pickedFile != null)
              Stack(
                children: [
                  Image.file(
                    File(_pickedFile!.path),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pickedFile = null;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 5,
                        top: 5,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.greyColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              Icons.close_rounded,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            if (_pickedFile == null)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton.icon(
                    onPressed: _getImage,
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      color: AppColors.onPrimaryColor,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    label: Text(
                      'Choose a photo',
                      style: AppConstants.textWhite(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }

  void _addPost() {}

  void _textFieldOnTap() {
    setState(() {
      readOnly = false;
    });
  }
}
