import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_notification_ex/PermissionManager.dart';

void main() async {
  // main()에서 플러그인을 초기화하려는 경우 해당 바인딩을 사용해 Flutter 엔진에 바인딩해준다.
  WidgetsFlutterBinding.ensureInitialized();

  // 플러그인 초기화
  await PermissionManager.initialization();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _count = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // 알람 권한 요청
    PermissionManager().requestPermissions();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            // 알림 타이머 시작
            _startTimer();
          },
          child: const Text('Local Notification')
        )
      ),
    );
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _count++;

        if( _count == 3 ) {
          PermissionManager().showNotification();
          _stopTimer();
        }
      });
    });
  }

  void _stopTimer() {
    timer?.cancel();
  }
}
