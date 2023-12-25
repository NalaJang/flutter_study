import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:value_listenable_builder_ex/util.dart';

import 'main.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({required this.userEmail, required this.userPassword, Key? key}) : super(key: key);

  final String userEmail;
  final String userPassword;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  final userUid = FirebaseAuth.instance.currentUser!.uid;
  final storage = const FlutterSecureStorage();
  String? userInfo = 'userInfo';

  @override
  Widget build(BuildContext context) {

    String userEmail = widget.userEmail;
    String userPassword = widget.userPassword;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('user login : $userEmail, $userPassword'),

            const SizedBox(height: 20,),

            // 로그아웃 버튼
            ElevatedButton(
              onPressed: () async {
                _signOut();
              },
              child: const Text('로그아웃')
            )
          ],
        ),
      ),
    );
  }

  // 로그아웃
  _signOut() async {
    await storage.write(key: userUid, value: STATUS_LOGOUT);

    Navigator.push(
      (context),
      MaterialPageRoute(
        builder: (context) => const FirstPage()
      )
    );
  }
}

