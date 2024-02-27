import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/dioModel.dart';

class DioProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  List<DioModel> modelList = [];
  int currentPage = 1;
  bool isAddPage = false;

  Future<void> started() async {
    await _getPhotos();
  }

  Future<void> _getPhotos() async {
    modelList = await _fetchPost(pageNo: currentPage);
    currentPage = 2;
    notifyListeners();
  }

  Future<List<DioModel>> _fetchPost({required int pageNo}) async {
    try {
      final response = await _dio.get("https://picsum.photos/v2/list?page=$pageNo&limit=10");

      if( response.statusCode == 200 ) {
        List<dynamic> fromData = response.data as List<dynamic>;
        List<DioModel> data = fromData.map((e) => DioModel.fromJson(e)).toList();

        return data;

      } else {
        return [];
      }
    } catch(error) {
      print('error > $error');
      return [];
    }
  }
}