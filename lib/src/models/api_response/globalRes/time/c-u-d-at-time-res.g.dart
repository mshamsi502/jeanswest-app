// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'c-u-d-at-time-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CUDAtTimeRes _$CUDAtTimeResFromJson(Map<String, dynamic> json) {
  return CUDAtTimeRes(
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    deletedAt: json['deleted_at'] as String,
  );
}

Map<String, dynamic> _$CUDAtTimeResToJson(CUDAtTimeRes instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
