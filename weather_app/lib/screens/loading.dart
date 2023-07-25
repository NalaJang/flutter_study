import 'package:flutter/material.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:http/http.dart' as http; // -> http package 에서 나온 메소드라는 것을 쉽게 알게 하기 위함.
import 'dart:convert'; // json parsing 을 위한 import

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // 위도와 경도
  double? getLatitude;
  double? getLongitude;

  // initState: 'loading' 이라는 statefulWidget 이 생성될 때 딱 한 번 호출됨.
  @override
  void initState() {
    super.initState();
    // 버튼 클릭 없이 앱이 실행될 때 바로 사용자의 위치를 찾기 위함.
    getLocation();

    fetchData();
  }

  // getMyCurrentLocation() 내의 position 변수에 값이 할당될 때까지 기다리기 위해
  // 여기도 async 방식으로 작동하게 한다.
  void getLocation() async {
    MyLocation myLocation = MyLocation();
    // await 는 future 의 값을 return 받아야 하므로
    // 'getMyCurrentLocation()'를 void -> Future<void>로 바꾸어 줌.
    await myLocation.getMyCurrentLocation();

    getLatitude = myLocation.myLatitude;
    getLongitude = myLocation.myLongitude;
    print('getLatitude: $getLatitude');
    print('getLongitude: $getLongitude');
  }

  // dummy data 를 통해 날씨 정보 가져오기
  void fetchData() async {
    var uri = Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    // get() 은 Future 메소드이기 때문에 async 방식으로 작동해야 한다.
    // 따라서 weather data 를 모두 가져올 때까지 기다려야 함을 뜻한다.
    // 그래서 await 키워드를 넣어주고 와 fetchData()를 async 방식으로 해주어야 한다.
    http.Response response = await http.get(uri);
    // -> http package 에서 나온 메소드라는 것을 쉽게 알게 하기 위함.

    if( response.statusCode == 200 ) {
      String jsonData = response.body;
      // json data parsing
      var myJson = jsonDecode(jsonData)['wind']['speed'];
      // json data 출력
      print(myJson);

    } else {
      print(response.statusCode);
    }
    // print(response.body);
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
