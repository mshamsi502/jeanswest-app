// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level-cards-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelCardsRes _$LevelCardsResFromJson(Map<String, dynamic> json) {
  return LevelCardsRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : LevelCardsData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LevelCardsResToJson(LevelCardsRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
