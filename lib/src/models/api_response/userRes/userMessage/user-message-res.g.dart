// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-message-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMessageRes _$UserMessageResFromJson(Map<String, dynamic> json) {
  return UserMessageRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : UserMessageData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserMessageResToJson(UserMessageRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
