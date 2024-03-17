import 'package:json_annotation/json_annotation.dart';
part 'colorModel.g.dart';

@JsonSerializable()
class ColorModel {

  int id;
  String name;
  int year;
  String color;
  @JsonKey(name: 'pantone_value')
  String pantoneVale;

  ColorModel({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneVale
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) => _$ColorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorModelToJson(this);
}