import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Intl.message('test')
        ),
      ),

      body: Center(
        child: Text(
          Intl.message('test2')
        ),
      ),
    );
  }
}
