import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class ImageLogic {
  ImageLogic({required this.picker});

  final ImagePicker picker;

  Future<XFile?> getImage() async {
    return await picker.pickImage(
      source: ImageSource.gallery,
    );
  }
}
