import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yummy_chat_lecture/screens/chat_screen.dart';
import 'package:yummy_chat_lecture/screens/main_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  // Firebase.initializedApp()과 같은 비동기 메소드를 사용하기 위해
  // flutter core engine 초기화가 필요하다.
  // 따라서 메인 메소드 내에서 비동기 방식으로 ensureInitialized 메소드를 먼저 불러와야 한다.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // 안드로이드는 잘 진행되는데
    // ios 로 앱을 실행하면 'Firebase has not been correctly initialized.' error 발생
    // 아래 코드를 통해 해결한다.
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting app',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),

      home: StreamBuilder(
        // 이 stream 은 authentication state 가 바뀔 때마다 새로운 value 을 전달해준다.
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // snapshot 이 인증 받은 token(권한) 을 가지고 있다면(참고로 token 은 firebase_auth 에서 관리한다.)
          // 즉, 유효한 사용자라면,
          if( snapshot.hasData ) {
            return ChatScreen();
          }
          return LoginSignupScreen();
        },
      ),
    );
  }
}
