// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all-province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllProvince _$AllProvinceFromJson(Map<String, dynamic> json) {
  return AllProvince(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Province.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AllProvinceToJson(AllProvince instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
