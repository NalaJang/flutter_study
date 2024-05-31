import 'package:flutter/material.dart';
import 'package:widgets_binding_observer_ex/my_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHome(),
    );
  }
}
