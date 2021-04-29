// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-messages-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMessagesInfoRes _$UserMessagesInfoResFromJson(Map<String, dynamic> json) {
  return UserMessagesInfoRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : MessageData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserMessagesInfoResToJson(
        UserMessagesInfoRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
