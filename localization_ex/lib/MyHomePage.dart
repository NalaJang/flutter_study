import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    String hello(String yourName) => Intl.message(
      'Hello, $yourName',
      name: 'test2',
      args: [yourName],
      desc: 'Say hello',
      examples: const {'yourName': 'James'},
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
            Intl.message('test')
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(hello('James')),

            const SizedBox(height: 30,),

            Text(
                Intl.message('test2', args: ['코린이'])
            ),
          ],
        ),
      ),
    );
  }
}
