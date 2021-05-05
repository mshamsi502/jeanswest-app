// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all-district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllDistrict _$AllDistrictFromJson(Map<String, dynamic> json) {
  return AllDistrict(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : District.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AllDistrictToJson(AllDistrict instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
