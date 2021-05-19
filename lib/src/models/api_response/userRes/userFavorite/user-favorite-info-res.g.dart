// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-favorite-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFavoriteInfoRes _$UserFavoriteInfoResFromJson(Map<String, dynamic> json) {
  return UserFavoriteInfoRes(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : SingleProductInfoRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..statusCode = json['statusCode'] as int
    ..message = json['message'] as String;
}

Map<String, dynamic> _$UserFavoriteInfoResToJson(
        UserFavoriteInfoRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
