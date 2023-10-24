import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:exo_post/features/shared/presentation/widgets/button_shared.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostAdd extends StatefulWidget {
  const PostAdd({super.key});

  @override
  State<PostAdd> createState() => _PostAddState();
}

class _PostAddState extends State<PostAdd> {
  String _postContent = '';
  static const double maxImageHeight = 1000;
  static const double maxImageWidth = 800;
  final picker = ImagePicker();

  XFile? _pickedFile;

  Future _getImage() async {
    _pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: maxImageHeight,
      maxWidth: maxImageWidth,
      imageQuality: 70,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('No image selected.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImage,
              child: const Text('Upload Image'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  _postContent = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Write your post here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ButtonShared(
              text: "Add Post".toUpperCase(),
              colorButton: AppColors.primaryColor,
              onClick: _addPost,
            ),
          ],
        ),
      ),
    );
  }

  void _addPost() {
    print('Added post with content: $_postContent');
    if (_pickedFile == null) {
      AppUtils.showAlert(
          context, 'Please select an image first', AppColors.errorColor);
      return;
    }
    if (_postContent == '') {
      AppUtils.showAlert(
          context, 'Please enter a caption', AppColors.errorColor);
    }
  }

  void _uploadImage() {}
}
