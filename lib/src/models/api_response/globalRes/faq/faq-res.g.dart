// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQRes _$FAQResFromJson(Map<String, dynamic> json) {
  return FAQRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : FAQData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FAQResToJson(FAQRes instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
