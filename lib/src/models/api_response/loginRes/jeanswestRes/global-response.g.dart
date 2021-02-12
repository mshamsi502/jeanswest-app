// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global-response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalResponse _$GlobalResponseFromJson(Map<String, dynamic> json) {
  return GlobalResponse(
    code: json['code'] as int,
    message: json['message'] as String,
    data: json['data'] as String,
  );
}

Map<String, dynamic> _$GlobalResponseToJson(GlobalResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
