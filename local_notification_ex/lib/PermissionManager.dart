import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {

  // 싱글톤
  static final PermissionManager _instance = PermissionManager._();
  factory PermissionManager() {
    return _instance;
  }
  PermissionManager._();


  void checkNotificationPermission(BuildContext context) async {
    final status = await requestNotificationPermission();

    if( status.isDenied || status.isPermanentlyDenied ) {
      if( context.mounted ) {

        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('알람 권한'),
            content: Text('알람이 꺼져 있습니다.'),
            actions: [
              // 닫기
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('닫기')
              ),

              // 알람 설정 화면으로 가기
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  openAppSettings();
                },
                child: Text('알람 켜기')
              ),
            ],
          )
        );
      }
    }
  }

  Future<PermissionStatus> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    return status;
  }
}