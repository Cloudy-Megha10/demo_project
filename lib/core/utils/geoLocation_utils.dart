import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../models/geo_location_model.dart';

class GeoLocationUtils {
  static Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  static Future<GeoLocationModel> getCurrentLocation() async {
    Position position = await getGeoLocationPosition();
    List<Placemark> currentplace =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    var geoLocationModel = GeoLocationModel();
    geoLocationModel.lat = position.latitude;
    geoLocationModel.long = position.longitude;
    geoLocationModel.address = "";
    if (currentplace.length > 0) {
      Placemark place = currentplace[0];
      geoLocationModel.address =
          '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    }
    return geoLocationModel;
  }

  static Future<String> getLatLogByAddress(String address) async {
    var res = await locationFromAddress(address);

    return "${res[0].latitude}, ${res[0].longitude}";
  }
}
