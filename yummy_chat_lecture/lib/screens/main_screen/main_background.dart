import 'package:flutter/material.dart';

class MainBackground {

  final iconImage = 'image/red.jpg';
  final welcomeText = 'Welcome';

  Widget background(bool isSignupScreen) {

    return Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 300.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(iconImage),
                fit: BoxFit.fill
            ),
          ),

          child: Container(
            padding: const EdgeInsets.only(top: 90, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: welcomeText,
                    style: const TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 25,
                        color: Colors.white
                    ),

                    children: [
                      TextSpan(
                        text: isSignupScreen ?
                        ' to Yummy chat!' : ' back',

                        style: const TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),

                Text(
                  isSignupScreen ?
                  'Signup to continue' : 'SignIn to continue',

                  style: const TextStyle(
                      letterSpacing: 1.0,
                      color: Colors.white
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}