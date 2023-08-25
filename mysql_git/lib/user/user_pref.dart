import 'dart:convert';

import '../model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUser {
  static Future<void> saveRememberUserInfo(User userInfo) async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    // user 정보를 json 포맷으로 인코딩
    String userJsonData = jsonEncode(userInfo.toJson());

    // 로컬 저장소(현재 사용하는 디바이스)에 로그인 된 유저 정보 저장
    await preferences.setString("currentUser", userJsonData);
  }
}