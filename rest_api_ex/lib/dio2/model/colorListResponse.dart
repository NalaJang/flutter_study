import 'package:rest_api_ex/dio2/model/colorModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'colorListResponse.g.dart';

@JsonSerializable()
class ColorListResponse {

  ColorModel data;

  ColorListResponse({required this.data});

  factory ColorListResponse.fromJson(Map<String, dynamic> json) => _$ColorListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ColorListResponseToJson(this);
}