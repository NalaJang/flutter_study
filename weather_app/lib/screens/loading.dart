import 'package:flutter/material.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
const apiKey = '86ef50e7e4cc961722fd402718d24d01';

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

    // dummy data 를 통해 날씨 정보 가져오기
    // String uri = 'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1';
    // 'open weather' 사이트에서 받은 apiKey 로 날씨 정보 가져오기
    String uri = 'https://api.openweathermap.org/data/2.5/weather?'
        'lat=$getLatitude&lon=$getLongitude&appid=$apiKey';
    Network network = Network(uri);

    // getJsonData() 가 Future<dynamic> 타입으로 데이터를 전달해주고 있으므로 await 를 붙여준다.
    var weather = await network.getJsonData();
    print('weather: $weather');
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
