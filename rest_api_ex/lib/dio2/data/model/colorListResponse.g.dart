// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colorListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorListResponse _$ColorListResponseFromJson(Map<String, dynamic> json) =>
    ColorListResponse(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      totalPages: json['total_pages'] as int,
      data: ColorModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ColorListResponseToJson(ColorListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
    };
