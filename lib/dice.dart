import 'package:flutter/material.dart';

void main() => runApp(Dice());

// 버튼을 클릭할 때마다 주사위 값을 변경하기 위해서 Stateless -> StatefulWidget 으로 변경
class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: EdgeInsets.all(32.0),

              child: Row(
                children: [
                  Expanded(
                      child: Image.asset('image/dice1.png')
                  ),
                  SizedBox(
                    width: 20.0,
                  ),

                  Expanded(
                      child: Image.asset('image/dice2.png')
                  )
                ],
              ),
            ),

            SizedBox(
              height: 60.0,
            ),

            ButtonTheme(
              minWidth: 100.0,
              height: 60.0,

              child: ElevatedButton(
                onPressed: (){},
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50.0,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
