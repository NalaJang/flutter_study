import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomLogInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomLogInterceptor({required this.storage});

  // 요청 전처리(헤더 추가, 토큰 갱신 등)
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);

    print('[Request] [${options.method}] ${options.uri}');

    // 보내려는 요청의 헤더
    if( options.headers['accessToken'] == 'true' ) {
      // 헤더 삭제
      options.headers.remove('accessToken');

      // 실제 토큰 대체
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');
      options.headers.addAll({'authorization' : 'Bearer $token'});
    }
  }

  // 응답 후처리(응답 로깅, 에러 처리 등)
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);

    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

  }

  // 에러 처리(에러 로깅, 다시 시도 등)
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);

    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');


  }

}