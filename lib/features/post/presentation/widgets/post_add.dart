import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/constants.dart';
import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../../common/utils/app_validator.dart';
import '../../../../main_dev.dart';
import '../bloc/post_bloc.dart';

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
  late TextEditingController _contentTextFieldController;
  final _formKey = GlobalKey<FormState>();
  bool readOnly = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _focus = FocusNode();
    _contentTextFieldController = TextEditingController();
    _keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription =
        _keyboardVisibilityController.onChange.listen((event) {
      setState(() {
        readOnly = !event;
      });
    });
  }

  Future<void> _getImage() async {
    _pickedFile = await imageLogic.getImage();
    setState(() {});
  }

  @override
  void dispose() {
    _focus.dispose();
    _keyboardSubscription.cancel();
    _contentTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (readOnly) {
      _focus.requestFocus();
    }
    return BlocListener<PostBloc, PostState>(listener: (context, state) {
      if (state is AddPostFinished) {
        if (state.status == Status.waiting) {
          AppUtils.showLoader(context: context);
        } else if (state.status == Status.succeded) {
          context.pop();
          AppUtils.showAlert(context, state.message ?? 'Success',
              AppUtils.accentprimaryColor(context));
          context.go('/home/0');
        } else if (state.status == Status.failed) {
          context.pop();
          context.pop();
          AppUtils.showAlert(
              context, state.message ?? 'Error', AppColors.errorColor);
        }
      }
    }, child: StatefulBuilder(
      builder: (context, setState) {
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
                  _buttonClosePop(),
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
                  child: _sectionContentTextPost(),
                ),
              ),
              _displayImageUpload(),
              _buttonUploadImage(),
            ],
          ),
        );
      },
    ));
  }

  Widget _buttonClosePop() {
    return GestureDetector(
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
    );
  }

  Widget _displayImageUpload() {
    if (_pickedFile != null) {
      return Stack(
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
      );
    }
    return Container();
  }

  Widget _sectionContentTextPost() {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _contentTextFieldController,
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
        validator: AppValidors.commentValidtor,
      ),
    );
  }

  Widget _buttonUploadImage() {
    if (_pickedFile == null) {
      return Padding(
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
      );
    }
    return Container();
  }

  void _addPost() async {
    if (_formKey.currentState!.validate()) {
      String content = _contentTextFieldController.text.toString().trim();
      String? base64Image;
      if (_pickedFile != null) {
        List<int> imageBytes = await _pickedFile!.readAsBytes();
        base64Image = base64Encode(imageBytes);
      }
      _callApiAdd(content, base64Image);
    }
  }

  void _callApiAdd(String content, String? base64Image) {
    context
        .read<PostBloc>()
        .add(AddPost(content: content, base64Image: base64Image));
  }

  void _textFieldOnTap() {
    setState(() {
      readOnly = false;
    });
  }
}
