// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-message-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMessageResult _$UserMessageResultFromJson(Map<String, dynamic> json) {
  return UserMessageResult(
    id: json['id'] as String,
    active: json['active'] as bool,
    title: json['title'] as String,
    body: json['body'] as String,
    image: json['image'] as String,
    version: json['version'] as int,
    datetime: json['datetime'] == null
        ? null
        : CUDAtTimeRes.fromJson(json['datetime'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserMessageResultToJson(UserMessageResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'title': instance.title,
      'body': instance.body,
      'image': instance.image,
      'version': instance.version,
      'datetime': instance.datetime,
    };
