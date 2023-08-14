import 'package:firestore_ex/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final hello = 'Hello';
  final welcomeBack = 'Welcome back';
  final signIn = 'Sign in';
  final notAMember = 'Not a member?';
  final registerNow = ' Register Now!';

  String userEmail = '';
  String userPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone_android,
              size: 100,
            ),

            SizedBox(height: 30),

            Text(hello),

            SizedBox(height: 10),

            Text(
              welcomeBack,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 50),

            // email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    onChanged: (value){
                      userEmail = value;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Email'
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),

            // password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)
                ),

                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Password'
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),

            // 로그인 버튼
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12)
                ),

                child: Center(
                  child: Text(
                    signIn,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 25,),

            // 회원가입 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(notAMember),
                // RenderPointerListener object was given an infinite size during layout.
                // -> error 가 계속 나서 우선 GestureDetector() 주석 처리
                // GestureDetector(
                //   onTap: (){
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => SignupPage())
                //     );
                //   },
                // ),

                Text(
                  registerNow,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
