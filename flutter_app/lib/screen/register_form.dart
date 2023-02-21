import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_app/utility/adaptive_size.dart';
import 'package:flutter_app/utility/color_utils.dart';
import 'package:flutter_app/utility/enums.dart';
import 'package:flutter_app/viewmodel/firebase_viewmodel.dart';
import 'package:flutter_app/viewmodel/geolocator_viewmodel.dart';
import 'package:flutter_app/viewmodel/image_picker_viewmodel.dart';
import 'package:flutter_app/widgets/radio_button.dart';
import 'package:flutter_app/widgets/text_input.dart';
import 'package:provider/provider.dart';

class register_form_screen extends StatefulWidget {
  const register_form_screen({super.key});

  @override
  State<register_form_screen> createState() => _register_form_screenState();
}

class _register_form_screenState extends State<register_form_screen> {
  String? imagePath;
  ValueNotifier<enumJenisKelamin> radioJenisKelaminVal =
      ValueNotifier<enumJenisKelamin>(enumJenisKelamin.pria);
  ValueNotifier<bool> isGetLocationSuccess = ValueNotifier<bool>(false);
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();
  TextEditingController controllerNomorHP = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);

    final geoLocatorProvider =
        Provider.of<GeoLocatorViewmodel>(context, listen: false);
    final listenGeoLocationProvider =
        Provider.of<GeoLocatorViewmodel>(context, listen: true);
    final imagePickerProvider =
        Provider.of<ImagePickerViewmodels>(context, listen: false);
    final listenImagePickerProvider =
        Provider.of<ImagePickerViewmodels>(context, listen: true);
    final firebaseProvider =
        Provider.of<FirebaseViewmodels>(context, listen: false);
    final listenFirebaseProvider =
        Provider.of<FirebaseViewmodels>(context, listen: true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: AdaptSize.paddingTop),
        child: SizedBox(
          width: AdaptSize.screenWidth,
          height: AdaptSize.screenHeight,
          child: Form(
            child: Center(
              child: SizedBox(
                width: AdaptSize.screenWidth - 40,
                height: AdaptSize.screenWidth + 120,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  elevation: 20,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: AdaptSize.pixel16),
                        child: Text(
                          "Form Pendafataran",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: AdaptSize.pixel16),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AdaptSize.pixel16),
                        child: labeledTextField(
                            fieldLabel: "Nama",
                            labelSize: AdaptSize.pixel12,
                            hintTexts: "Denji",
                            size: AdaptSize.pixel160 + AdaptSize.pixel60,
                            textController: controllerNama),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AdaptSize.pixel16),
                        child: labeledTextField(
                            fieldLabel: "Alamat",
                            labelSize: AdaptSize.pixel12,
                            hintTexts: "Jatinagor jl 23",
                            size: AdaptSize.pixel160 + AdaptSize.pixel60,
                            textController: controllerAlamat),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AdaptSize.pixel16),
                        child: labeledTextField(
                            fieldLabel: "No HP",
                            textController: controllerNomorHP,
                            labelSize: AdaptSize.pixel12,
                            hintTexts: "0822633XXX",
                            size: AdaptSize.pixel160 + AdaptSize.pixel60),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AdaptSize.pixel16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Jenis Kelamin : ",
                              style: TextStyle(
                                  fontSize: AdaptSize.pixel12,
                                  fontWeight: FontWeight.w300),
                            ),
                            Row(
                              children: [
                                customRadioButton(
                                    context: context,
                                    customRadioController: radioJenisKelaminVal,
                                    controlledValue: enumJenisKelamin.pria),
                                Text(
                                  "Pria",
                                  style: TextStyle(
                                      fontSize: AdaptSize.pixel12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                customRadioButton(
                                    context: context,
                                    customRadioController: radioJenisKelaminVal,
                                    controlledValue: enumJenisKelamin.wanita),
                                Text(
                                  "Wanita",
                                  style: TextStyle(
                                      fontSize: AdaptSize.pixel12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AdaptSize.pixel16),
                        child: SizedBox(
                          width: AdaptSize.screenWidth - 160,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: AdaptSize.pixel60,
                                width: AdaptSize.pixel75,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    geoLocatorProvider.getCurrentAddress();
                                    isGetLocationSuccess =
                                        ValueNotifier<bool>(true);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      backgroundColor: Colors.white,
                                      side: BorderSide(
                                          color: Colors.black, width: 2)),
                                  child: Text(
                                    "Cek Lokasi",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: AdaptSize.pixel12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: AdaptSize.pixel40,
                                height: AdaptSize.pixel40,
                                child: ValueListenableBuilder(
                                  valueListenable: isGetLocationSuccess,
                                  builder: (context, value, child) {
                                    return Icon(
                                      Icons.location_on,
                                      color: value != false
                                          ? MyColor.success600
                                          : MyColor.primary400,
                                    );
                                  },
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                height: AdaptSize.pixel60,
                                width: AdaptSize.pixel75,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    imagePickerProvider.getImage();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      backgroundColor: MyColor.success900,
                                      side: BorderSide(
                                          color: MyColor.success200, width: 2)),
                                  child: Text(
                                    "Upload Foto Diri",
                                    style: TextStyle(
                                        color: MyColor.success200,
                                        fontSize: AdaptSize.pixel12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(controllerNomorHP.text),
                      Padding(
                        padding: EdgeInsets.only(top: AdaptSize.pixel16),
                        child: SizedBox(
                          height: AdaptSize.pixel30,
                          width: AdaptSize.pixel160,
                          child: Consumer<GeoLocatorViewmodel>(
                              builder: (context, value, child) {
                            return ElevatedButton(
                              onPressed: () async {
                                if (listenImagePickerProvider.imageFile !=
                                    null) {
                                  firebaseProvider.createUserSensus(
                                      nama: controllerNama.text,
                                      alamat: controllerAlamat.text,
                                      lat: value.currentPosition?.latitude ??
                                          1.1,
                                      long: value.currentPosition?.longitude ??
                                          1.1,
                                      imageFile:
                                          listenImagePickerProvider.imageFile!,
                                      noHp: controllerNomorHP.text);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  backgroundColor: MyColor.secondary600,
                                  side: BorderSide(
                                      color: MyColor.secondary400, width: 2)),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AdaptSize.pixel12,
                                    fontWeight: FontWeight.w400),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.network(listenFirebaseProvider.imageUrl !=
                                null
                            ? listenFirebaseProvider.imageUrl!
                            : "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
