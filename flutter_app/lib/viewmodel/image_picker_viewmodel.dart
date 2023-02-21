import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/services/general_service.dart';

class ImagePickerViewmodels with ChangeNotifier {
  File? imageFile;
  void getImage() async {
    imageFile = await imagePickerService();
    notifyListeners();
  }
}
