import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> imagePickerService() async {
  final picker = ImagePicker();
  final fetchedImage = await picker.pickImage(source: ImageSource.gallery);
  if (fetchedImage != null) {
    return File(fetchedImage.path);
  }
}
