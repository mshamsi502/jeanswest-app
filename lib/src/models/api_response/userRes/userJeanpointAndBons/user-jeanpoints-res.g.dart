// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-jeanpoints-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJeanpointsRes _$UserJeanpointsResFromJson(Map<String, dynamic> json) {
  return UserJeanpointsRes(
    statusCode: json['statusCode'] as int,
  )
    ..message = json['message'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : UserJeanpointsData.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserJeanpointsResToJson(UserJeanpointsRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
