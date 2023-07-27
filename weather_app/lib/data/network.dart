import 'package:http/http.dart' as http; // -> http package 에서 나온 메소드라는 것을 쉽게 알게 하기 위함.
import 'dart:convert'; // json parsing 을 위한 import

class Network {
  final String weatherUri;
  final String airPollutionUri;
  // 생성자를 통해 url 을 받도록 함.
  Network(this.weatherUri, this.airPollutionUri);

  // 날씨 데이터 타입은 다양할 것이므로 dynamic type 으로 함.
  Future<dynamic> getJsonData() async {

    // get() 은 Future 메소드이기 때문에 async 방식으로 작동해야 한다.
    // 따라서 weather data 를 모두 가져올 때까지 기다려야 함을 뜻한다.
    // 그래서 await 키워드를 넣어주고 와 fetchData()를 async 방식으로 해주어야 한다.
    http.Response response = await http.get(Uri.parse(weatherUri));
    // -> http 를 붙여준 이유: http package 에서 나온 메소드라는 것을 쉽게 알게 하기 위함.

    if( response.statusCode == 200 ) {

      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);

      return parsingData;

    }

  }
}