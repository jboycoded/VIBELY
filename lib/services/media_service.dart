import 'package:image_picker/image_picker.dart';

class MediaService {
  final picker = ImagePicker();

  Future<String?> pickImage() async {
    final file = await picker.pickImage(source: ImageSource.gallery);
    return file?.path;
  }
}
