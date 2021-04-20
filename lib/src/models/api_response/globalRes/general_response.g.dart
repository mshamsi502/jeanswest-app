// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralRespons _$GeneralResponsFromJson(Map<String, dynamic> json) {
  return GeneralRespons(
    statusCode: json['statusCode'] as int,
  )
    ..message = json['message'] as String
    ..data = json['data'];
}

Map<String, dynamic> _$GeneralResponsToJson(GeneralRespons instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
