import 'package:flutter/material.dart';

import 'ex/expansionPanelListEx.dart';
import 'ex/expansionPanelRadioEx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Example(),
    );
  }
}

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PanelListEx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpansionPanelListEx()
                      )
                  );
                },
                child: Text('ExpansionPanelListEx')
            ),

            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpansionPanelRadioEx()
                      )
                  );
                },
                child: Text('ExpansionPanelListEx')
            )
          ],
        ),
      ),
    );
  }
}


