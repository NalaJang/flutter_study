import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$cityName',
                style: TextStyle(
                  fontSize: 30.0
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              Text(
                '$temp',
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
