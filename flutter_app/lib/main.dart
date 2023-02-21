import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/register_form.dart';
import 'package:flutter_app/viewmodel/firebase_viewmodel.dart';
import 'package:flutter_app/viewmodel/geolocator_viewmodel.dart';
import 'package:flutter_app/viewmodel/image_picker_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const home_page());
}

class home_page extends StatelessWidget {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: FirebaseViewmodels()),
        ChangeNotifierProvider.value(value: GeoLocatorViewmodel()),
        ChangeNotifierProvider.value(value: ImagePickerViewmodels())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: register_form_screen(),
      ),
    );
  }
}
