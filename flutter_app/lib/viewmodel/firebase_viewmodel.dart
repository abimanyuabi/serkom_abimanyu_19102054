import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/services/api_service.dart';

class FirebaseViewmodels with ChangeNotifier {
  String? imageUrl;
  void createUserSensus(
      {required File imageFile,
      required String alamat,
      required String noHp,
      required String nama,
      required double lat,
      required double long}) async {
    imageUrl = await uploadImageFile(imageFile: imageFile, noHp: noHp);
    notifyListeners();
    await createUserSensusRecord(
        alamat: alamat,
        imageUrl: imageUrl ??
            "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png",
        nama: nama,
        lat: lat,
        long: long,
        noHp: noHp);
  }
}
