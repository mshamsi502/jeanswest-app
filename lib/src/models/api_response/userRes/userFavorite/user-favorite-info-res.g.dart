// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-favorite-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFavoriteInfoRes _$UserFavoriteInfoResFromJson(Map<String, dynamic> json) {
  return UserFavoriteInfoRes(
    data: json['data'] == null
        ? null
        : DataFavoriteInfoRes.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserFavoriteInfoResToJson(
        UserFavoriteInfoRes instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
