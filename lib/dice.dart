import 'package:flutter/material.dart';

void main() => runApp(Dice());


class Dice extends StatelessWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Dice game'),
      ),

      body: Center(
        child: Column(
          children: [

            Row(
              children: [
                Expanded(
                    child: Image.asset('image/dice1.png')
                ),
                Expanded(
                    child: Image.asset('image/dice2.png')
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
