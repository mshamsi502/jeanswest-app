// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-message-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMessageData _$UserMessageDataFromJson(Map<String, dynamic> json) {
  return UserMessageData(
    result: (json['result'] as List)
        ?.map((e) => e == null
            ? null
            : UserMessageResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    page: json['page'] as int,
    perPage: json['perPage'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$UserMessageDataToJson(UserMessageData instance) =>
    <String, dynamic>{
      'result': instance.result,
      'page': instance.page,
      'perPage': instance.perPage,
      'total': instance.total,
    };
