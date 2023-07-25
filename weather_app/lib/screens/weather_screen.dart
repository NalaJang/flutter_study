import 'package:flutter/material.dart';

class WeatherScreenState extends StatefulWidget {
  const WeatherScreenState({Key? key}) : super(key: key);

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
