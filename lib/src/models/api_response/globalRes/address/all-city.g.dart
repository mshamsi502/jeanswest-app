// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all-city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCity _$AllCityFromJson(Map<String, dynamic> json) {
  return AllCity(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : City.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AllCityToJson(AllCity instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
