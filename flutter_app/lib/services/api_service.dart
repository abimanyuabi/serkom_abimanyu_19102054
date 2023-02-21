import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<LocationPermission> getUserLocationPermission() async {
  return await Geolocator.checkPermission();
}

Future<Position?> getLocation() async {
  print("ok");
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}

Future<List<Placemark?>> getAddress({required Position currPosition}) async {
  List<Placemark?> currentAddress = [];
  List<Placemark> pos = await placemarkFromCoordinates(
      currPosition.latitude, currPosition.longitude);
  currentAddress = pos;
  return currentAddress;
}

Future<String?> uploadImageFile(
    {required File imageFile, required String noHp}) async {
  String fileName = basename(imageFile.path);
  final ref =
      FirebaseStorage.instance.ref().child("imageAsset").child(noHp + ".jpg");
  await ref.putFile(imageFile);
  final imageLinkSnapshot = await ref.getDownloadURL();
  print("url : " + imageLinkSnapshot);
  if (imageLinkSnapshot != null) {
    return imageLinkSnapshot;
  }
}

Future<dynamic> createUserSensusRecord(
    {required String alamat,
    required String imageUrl,
    required String nama,
    required double lat,
    required double long,
    required String noHp}) async {
  Map<String, dynamic> dataMaps = {
    "Alamat": alamat,
    "ImageUrl": imageUrl,
    "Latitude": lat,
    "Longitude": long,
    "Nama": nama,
    "NoHp": noHp
  };
  final result = await FirebaseFirestore.instance
      .collection("RegistrasiSensus")
      .doc()
      .set(dataMaps);
}
