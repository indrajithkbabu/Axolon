import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageService {
  Future<File?> pickImage(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      File imgFile = File(file.path);
      return imgFile;
    }
    return null;
  }
}
