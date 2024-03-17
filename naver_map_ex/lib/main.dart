import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

import 'naver_map_app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
    clientId: 'ol8npv12s2',
    onAuthFailed: (ex) {
      print("********* 네이버맵 인증오류 : $ex *********");
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NaverMapApp(),
    );
  }
}

