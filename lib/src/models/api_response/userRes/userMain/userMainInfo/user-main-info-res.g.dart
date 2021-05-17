// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-main-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMainInfoRes _$UserMainInfoResFromJson(Map<String, dynamic> json) {
  return UserMainInfoRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : UserMainInfoData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserMainInfoResToJson(UserMainInfoRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
