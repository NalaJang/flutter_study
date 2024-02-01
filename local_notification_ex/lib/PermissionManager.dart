import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {

  // 싱글톤
  static final PermissionManager _instance = PermissionManager._();
  factory PermissionManager() {
    return _instance;
  }
  PermissionManager._();

  static const String channelId = 'channel id';
  static const String channelName = 'channel name';


  // local notification 플러그인 인스턴스 생성
  static FlutterLocalNotificationsPlugin localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // 플러그인 초기화
  static initialization() async {
    // 알림을 표시할 때 사용할 아이콘
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosInitializationSettings =
    DarwinInitializationSettings(
      // 내가 원할 때 권한 요청을 하기 위해 false 값을 부여.
      // true 일 경우, 앱이 실행되고 바로 권한 요청을 한다.
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false
    );

    const InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings
    );

    // 알림 초기화
    await localNotificationsPlugin.initialize(initializationSettings);
}



  void checkNotificationPermission(BuildContext context) async {
    final status = await requestNotificationPermission();

    if( status.isDenied || status.isPermanentlyDenied ) {
      if( context.mounted ) {

        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('알람 권한'),
            content: const Text('알람이 꺼져 있습니다.'),
            actions: [
              // 닫기
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('닫기')
              ),

              // 알람 설정 화면으로 가기
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  openAppSettings();
                },
                child: const Text('알람 켜기')
              ),
            ],
          )
        );
      }
    }
  }

  // 알림 권한 요청
  Future<void> requestPermissions() async {
    if( Platform.isAndroid ) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          localNotificationsPlugin
              .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

          await androidImplementation?.requestNotificationsPermission();

    } else if( Platform.isIOS ) {
      await localNotificationsPlugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
          alert: true,
          badge: true,
          sound: true
      );
    }
  }

  // 알림 표시
  Future<void> showNotification() async {
    // android 채널 세부 정보
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          channelId, channelName,
          channelDescription: 'channel description',
          importance: Importance.max,
          priority: Priority.max,
        );

    const NotificationDetails notificationDetails =
        NotificationDetails(
          android: androidNotificationDetails,
          iOS: DarwinNotificationDetails(badgeNumber: 1)
        );

    await localNotificationsPlugin.show(
      0, 'plain title', 'plain body', notificationDetails, payload: 'item x'
    );
  }

  Future<PermissionStatus> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    return status;
  }
}