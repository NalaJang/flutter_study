import 'package:flutter/material.dart';
import 'package:rest_api_ex/dio/dio_ex_screen.dart';

import 'dio2/ui/dio_result_page.dart';
import 'http/httpEx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DioResultPage(),
    );
  }
}
