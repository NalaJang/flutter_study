import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../model/httpModel.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  List<HttpModel> modelList = [];
  int currentPage = 1;
  bool isAddPage = false;


  // _fetchPost()를 통해 API 로부터 데이터를 받아와 modelList 변수에 데이터를 넣어준다.
  // currentPage 는 현재 페이지를 의미하며, 1번 페이지 호출 후 2번 페이지를 호출하기 위해 currentPage 값을 2로 변경
  Future<void> getPhotos() async {
    List<HttpModel>? data = await _fetchPost(pageNo: currentPage);
    modelList = data;
    currentPage = 2;
    print("currentPage > $currentPage");
    notifyListeners();
  }


  // API 통신은 비동기 통신이기 때문에 async-await 키워드를 사용해 비동기 처리를 해야 한다.
  Future<List<HttpModel>> _fetchPost({required int pageNo}) async {
    try {
      // "http.get" : GET 방식의 Rest API 호출
      http.Response _response = await http.get(
        // "Uri.parse" : 문자열을 기반으로 URI 객체 생성
        Uri.parse("https://picsum.photos/v2/list?page=$pageNo&limit=10")
      );

      // API 호출 성공
      if( _response.statusCode == 200 ) {
        List<dynamic> data = json.decode(_response.body);
        List<HttpModel> result = data.map((e) => HttpModel.fromJson(e)).toList();

        return result;

      } else {
        return [];
      }
    } catch(error) {
      print('error > $error');
      return [];
    }
  }

  void scrollListener(ScrollNotification notification) {
    if( notification.metrics.maxScrollExtent * 0.85 < notification.metrics.pixels ) {
      _morePhotos();
    }
  }

  Future<void> _morePhotos() async {
    if( !isAddPage ) {
      isAddPage = true;
      notifyListeners();
      
      List<HttpModel>? data = await _fetchPost(pageNo: currentPage);

      Future.delayed(const Duration(microseconds: 1000), () {
        modelList.addAll(data);
        currentPage = currentPage +1;
        isAddPage = false;
        notifyListeners();
      });
    }
  }
}