// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about-us-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutUsRes _$AboutUsResFromJson(Map<String, dynamic> json) {
  return AboutUsRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : AboutUsData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AboutUsResToJson(AboutUsRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
