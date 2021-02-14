// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date-time-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateTimeRes _$DateTimeResFromJson(Map<String, dynamic> json) {
  return DateTimeRes(
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    deletedAt: json['deletedAt'] as String,
  );
}

Map<String, dynamic> _$DateTimeResToJson(DateTimeRes instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
