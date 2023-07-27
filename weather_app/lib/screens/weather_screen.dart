import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherScreenState extends StatefulWidget {
  const WeatherScreenState({super.key, this.parseWeatherData});

  // 다양한 타입의 날씨 데이터를 전달 받기 때문에 타입을 dynamic 또는 따로 적지 않는다.
  final dynamic parseWeatherData;

  @override
  State<WeatherScreenState> createState() => _WeatherScreenStateState();
}

class _WeatherScreenStateState extends State<WeatherScreenState> {

  String? cityName;
  int? temp;

  @override
  void initState() {
    super.initState();

    updateData(widget.parseWeatherData);

  }

  void updateData(dynamic weatherData) {
    cityName = weatherData['name'];
    double doubleTemp = weatherData['main']['temp'];
    temp = doubleTemp.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // 좌측 아이콘일 때는 leading 속성 사용
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: (){},
          iconSize: 30.0,
        ),

        // 우측 아이콘일 때는 actions 사용
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.location_searching),
            iconSize: 30.0,
          ),

        ],
      ),

      body: Container(
        child: Stack(
          children: [
            Image.asset('image/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            ),

            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 150.0,
                  ),
                  Text('Seoul',
                  style: GoogleFonts.lato(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
