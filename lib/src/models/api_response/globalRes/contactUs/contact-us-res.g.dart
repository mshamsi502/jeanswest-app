// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact-us-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsRes _$ContactUsResFromJson(Map<String, dynamic> json) {
  return ContactUsRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : ContactUsData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContactUsResToJson(ContactUsRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
