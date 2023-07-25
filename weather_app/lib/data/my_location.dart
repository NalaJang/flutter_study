import 'package:geolocator/geolocator.dart';

class MyLocation {

  // 위도와 경도
  double? myLatitude;
  double? myLongitude;

  // void -> Future<void>
  Future<void> getMyCurrentLocation() async {

    LocationPermission permission = await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high); // LocationAccuracy: 위치의 정확도
      myLatitude = position.latitude;
      myLongitude = position.longitude;
      print('myLatitude: ${position.latitude}');
      print('myLongitude: ${position.longitude}');

    } catch(e) {
      print('There was a problem with the Internet connection.');
    }
  }
}