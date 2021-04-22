// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-jeanpoints-response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJeanpointsResponse _$UserJeanpointsResponseFromJson(
    Map<String, dynamic> json) {
  return UserJeanpointsResponse(
    statusCode: json['statusCode'] as int,
  )
    ..message = json['message'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : UserJeanpointsResult.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserJeanpointsResponseToJson(
        UserJeanpointsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
