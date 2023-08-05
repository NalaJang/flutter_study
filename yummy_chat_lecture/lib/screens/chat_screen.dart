import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yummy_chat_lecture/chatting/chat/message.dart'; // 모든 스트림의 과정을 관리하는 패키지

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print('loggedUser: ${loggedUser!.email}');
      }

    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat screen'),
        actions: [
          // 로그아웃 버튼
          IconButton(
            onPressed: (){
              // 로그아웃
              _authentication.signOut();
              // firebase_auth 패키지가 사용자가 발급받았던 토큰을 삭제함으로써
              // authentication state 가 바뀌는 이벤트를
              // main.dart 의 authStateChange stream 에 전달한다.
              // 따라서 더 이상 snapshot 이 토큰을 가지고 있지 않게 됨으로
              // Login 페이지로 이동하게 되기 때문에 pop 메소드 주석
              // Navigator.pop(context);
            },
            icon: Icon(
              Icons.exit_to_app_sharp,
              color: Colors.white,
            )
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            // column widget 내의 리스트 뷰가 무조건 화면 내의 모든 공간을 확보하면서 에러가 발생하기 때문에
            // Expanded widget 으로 감싼 뒤 Messages class 를 불러와야 한다.
            Expanded(
              child: Messages()
            ),
          ],
        ),
      )
    );
  }
}
