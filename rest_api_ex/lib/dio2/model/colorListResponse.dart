import 'package:rest_api_ex/dio2/model/colorModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'colorListResponse.g.dart';

@JsonSerializable()
class ColorListResponse {

  int page;
  @JsonKey(name: 'per_page')
  int perPage;
  int total;
  @JsonKey(name: 'total_pages')
  int totalPages;
  ColorModel data;

  ColorListResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory ColorListResponse.fromJson(Map<String, dynamic> json) => _$ColorListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ColorListResponseToJson(this);
}