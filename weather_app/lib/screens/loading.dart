import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // initState: 'loading' 이라는 statefulWidget 이 생성될 때 딱 한 번 호출됨.
  @override
  void initState() {
    super.initState();
    // 버튼 클릭 없이 앱이 실행될 때 바로 사용자의 위치를 찾기 위함.
    getLocation();
  }

  void getLocation() async {

    LocationPermission permission = await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high); // LocationAccuracy: 위치의 정확도
      print('position: $position');

    } catch(e) {
      print('There was a problem with the Internet connection.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){},
          child: Text('Get my location'),
        ),
      ),
    );
  }
}
