import 'package:flutter/material.dart';

class WeatherScreenState extends StatefulWidget {
  const WeatherScreenState({this.parseWeatherData}) : super(key: parseWeatherData);

  // 다양한 타입의 날씨 데이터를 전달 받기 때문에 타입을 dynamic 또는 따로 적지 않는다.
  final parseWeatherData;

  @override
  State<WeatherScreenState> createState() => _WeatherScreenStateState();
}

class _WeatherScreenStateState extends State<WeatherScreenState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'City name',
                style: TextStyle(
                  fontSize: 30.0
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              Text(
                'Temperature',
                style:TextStyle(
                  fontSize: 30.0
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
