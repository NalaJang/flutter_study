# weather_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Stack
* Http
* Geolocator.requestPermission() => 위치 가져오기
* 날씨 정보 가져오기

      // dummy data 를 통해 날씨 정보 가져오기
      // String uri = 'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1';
      // 'open weather' 사이트에서 받은 apiKey 로 날씨 정보 가져오기
      String weatherUri = 'https://api.openweathermap.org/data/2.5/weather?'
        'lat=$getLatitude&lon=$getLongitude&appid=$apiKey&units=metric';

      String airPollutionUri = 'http://api.openweathermap.org/data/2.5/air_pollution?'
        'lat=$getLatitude&lon=$getLongitude&appid=$apiKey';

      Network network = Network(weatherUri, airPollutionUri);
  
* 

## Images

<img width="603" alt="image" src="https://github.com/NalaJang/flutter_study/assets/73895803/b727ee87-df8a-4e3c-81fd-b108244f936d">

