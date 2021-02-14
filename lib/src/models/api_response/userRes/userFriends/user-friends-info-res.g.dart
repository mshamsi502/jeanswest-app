// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-friends-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFriendsInfoRes _$UserFriendsInfoResFromJson(Map<String, dynamic> json) {
  return UserFriendsInfoRes(
    friends: (json['friends'] as List)
        ?.map((e) => e == null
            ? null
            : UserMainInfoRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserFriendsInfoResToJson(UserFriendsInfoRes instance) =>
    <String, dynamic>{
      'friends': instance.friends,
    };
