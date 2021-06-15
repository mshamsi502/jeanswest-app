// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryRes _$CategoryResFromJson(Map<String, dynamic> json) {
  return CategoryRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : ListOfCategory.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CategoryResToJson(CategoryRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
