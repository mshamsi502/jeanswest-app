// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-friends-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFriendsInfoRes _$UserFriendsInfoResFromJson(Map<String, dynamic> json) {
  return UserFriendsInfoRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : UserMainInfoRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserFriendsInfoResToJson(UserFriendsInfoRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
