// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth-req-response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthReqRespons _$AuthReqResponsFromJson(Map<String, dynamic> json) {
  return AuthReqRespons(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : GetTokenRes.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthReqResponsToJson(AuthReqRespons instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
