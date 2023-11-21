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
import '../../domain/entities/requests/post_request.dart';
import '../bloc/post_bloc.dart';

class PostAddEdit extends StatefulWidget {
  final int? postid;
  final String? content;
  final String? urlimage;

  const PostAddEdit({super.key, this.postid, this.content, this.urlimage});

  @override
  State<PostAddEdit> createState() => _PostAddEditState();
}

class _PostAddEditState extends State<PostAddEdit> {
  XFile? _pickedFile;
  late ScrollController _scrollController;
  late FocusNode _focus;
  late StreamSubscription<bool> _keyboardSubscription;
  late KeyboardVisibilityController _keyboardVisibilityController;
  late TextEditingController _contentTextFieldController;
  final _formKey = GlobalKey<FormState>();
  bool readOnly = true;
  String? _urlImage;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _focus = FocusNode();
    _contentTextFieldController = TextEditingController(text: widget.content);
    _keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription =
        _keyboardVisibilityController.onChange.listen((event) {
      setState(() {
        readOnly = !event;
      });
    });

    if (widget.urlimage != null && widget.urlimage!.isNotEmpty) {
      _urlImage = widget.urlimage;
    }
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
        } else {
          context.read<PostBloc>().add(
              const GetAllPosts(repuest: PostRequest(page: 0, perPage: 5)));
          context.pop();
          context.pop();
          if (state.status == Status.succeded) {
            AppUtils.showAlert(context, state.message ?? 'Success',
                AppUtils.accentprimaryColor(context));
          } else if (state.status == Status.failed) {
            AppUtils.showAlert(
                context, state.message ?? 'Error', AppColors.errorColor);
          }
        }
      }
      if (state is UpdatePostFinished) {
        if (state.status == Status.waiting) {
          AppUtils.showLoader(context: context);
        } else {
          context.read<PostBloc>().add(
              const GetAllPosts(repuest: PostRequest(page: 0, perPage: 5)));
          context.pop();
          context.pop();
          if (state.status == Status.succeded) {
            AppUtils.showAlert(context, state.message ?? 'Success',
                AppUtils.accentprimaryColor(context));
          } else if (state.status == Status.failed) {
            context.pop();
            AppUtils.showAlert(
                context, state.message ?? 'Error', AppColors.errorColor);
          }
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
                      onPressed: _addEditPost,
                      icon: const Icon(
                        Icons.add_box,
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.greyColor,
                        foregroundColor: Colors.white,
                      ),
                      label: Text(
                        widget.postid != null ? 'Update Post' : 'Add Post',
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
    if (_pickedFile != null || _urlImage != null) {
      return Stack(
        children: [
          if (_pickedFile != null) Image.file(File(_pickedFile!.path)),
          if (_urlImage != null)
            Image.network(
              '$_urlImage',
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          GestureDetector(
            onTap: () {
              setState(() {
                _pickedFile = null;
                _urlImage = null;
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

  void _addEditPost() async {
    if (_formKey.currentState!.validate()) {
      String content = _contentTextFieldController.text.toString().trim();
      String? base64Image;
      if (_pickedFile != null) {
        List<int> imageBytes = await _pickedFile!.readAsBytes();
        base64Image = base64Encode(imageBytes);
      }
      if (widget.postid != null) {
        if (base64Image != null) {
          _callApiUpdate(content, base64Image, 'base64Image');
        } else {
          _callApiUpdate(content, _urlImage, 'url');
        }
      } else {
        _callApiAdd(content, base64Image);
      }
    }
  }

  void _callApiAdd(String content, String? base64Image) {
    context
        .read<PostBloc>()
        .add(AddPost(content: content, base64Image: base64Image));
  }

  void _callApiUpdate(String content, String? base64Image, String type) {
    context.read<PostBloc>().add(UpdatePost(
        postId: widget.postid ?? 0,
        content: content,
        base64Image: base64Image,
        type: type));
  }

  void _textFieldOnTap() {
    setState(() {
      readOnly = false;
    });
  }
}
