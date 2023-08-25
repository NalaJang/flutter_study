import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysql_git/authentication/signup.dart';
import 'package:http/http.dart' as http;
import 'package:mysql_git/user/user_pref.dart';

import '../api/api.dart';
import '../model/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  userLogin() async {
    try {
      var res = await http.post(
          Uri.parse(API.login),
          // 사용자가 입력한 데이터를 User 클래스에 전달하고 Json 포맷으로 바꾸어 준다.
          body: {
            'user_email' : emailController.text.trim(),
            'user_password' : passwordController.text.trim()
          }
      );

      // 통신 성공
      if( res.statusCode == 200 ) {
        var resLogin = jsonDecode(res.body);

        if( resLogin['success'] == true ) {
          Fluttertoast.showToast(msg: 'Login successfully');

          // 로그인에 성공한 이 특정 유저의 데이터를 기억하기 위함
          User userInfo = User.fromJson(resLogin['userData']);

          // 로그인 된 유저 정보 전달
          await RememberUser.saveRememberUserInfo(userInfo);

          setState(() {
            emailController.clear();
            passwordController.clear();

          });
        } else {
          Fluttertoast.showToast(msg: 'Please check your email or password');
        }
      }
    } catch(e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone_android,
                  size: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Hello',
                  style: GoogleFonts.bebasNeue(fontSize: 36.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: emailController,
                              validator: (val) =>
                              val == "" ? "Please enter email" : null,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Email'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (val) =>
                              val == "" ? "Please enter password" : null,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Password'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    GestureDetector(
                      onTap: () => Get.to(() => SignupPage()),
                      child: Text(
                        ' Register Now!',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
