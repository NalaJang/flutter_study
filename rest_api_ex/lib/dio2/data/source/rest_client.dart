import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/colorListResponse.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://reqres.in/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/unknown/{id}')
  Future<ColorListResponse> getColorList({@Path() required int id});
}