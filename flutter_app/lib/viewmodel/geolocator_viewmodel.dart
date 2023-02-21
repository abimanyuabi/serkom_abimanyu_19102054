import 'package:flutter/cupertino.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocatorViewmodel with ChangeNotifier {
  Position? currentPosition;

  String? address;
  late LocationPermission izinLokasi;

  void getCurrentAddress() async {
    LocationPermission permissionUser = await getUserLocationPermission();

    if (permissionUser == LocationPermission.denied) {
      print("denied");
      izinLokasi = await Geolocator.requestPermission();
    } else {
      currentPosition = await getLocation();
      notifyListeners();
      if (currentPosition != null) {
        print(currentPosition!.latitude);
        List<Placemark?> pos = await getAddress(currPosition: currentPosition!);
        Placemark? currAddress = pos[0];
        address =
            "${currAddress?.country}, ${currAddress?.locality}, ${currAddress?.postalCode}";
        notifyListeners();
      }
    }
  }
}
