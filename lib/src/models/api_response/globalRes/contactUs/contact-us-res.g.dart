// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact-us-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsRes _$ContactUsResFromJson(Map<String, dynamic> json) {
  return ContactUsRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ContactUsData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ContactUsResToJson(ContactUsRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
