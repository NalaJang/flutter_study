import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http; // -> http package 에서 나온 메소드라는 것을 쉽게 알게 하기 위함.

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

    fetchData();
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

  // dummy data 를 통해 날씨 정보 가져오기
  void fetchData() async {
    var uri = Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    // get() 은 Future 메소드이기 때문에 async 방식으로 작동해야 한다.
    // 따라서 weather data 를 모두 가져올 때까지 기다려야 함을 뜻한다.
    // 그래서 await 키워드를 넣어주고 와 fetchData()를 async 방식으로 해주어야 한다.
    http.Response response = await http.get(uri);
    // -> http package 에서 나온 메소드라는 것을 쉽게 알게 하기 위함.
    print(response.body);
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
