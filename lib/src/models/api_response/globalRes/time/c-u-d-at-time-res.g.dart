// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'c-u-d-at-time-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CUDAtTimeRes _$CUDAtTimeResFromJson(Map<String, dynamic> json) {
  return CUDAtTimeRes(
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    deletedAt: json['deletedAt'] as String,
  );
}

Map<String, dynamic> _$CUDAtTimeResToJson(CUDAtTimeRes instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
