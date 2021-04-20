// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp-req-response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPReqResponse _$OTPReqResponseFromJson(Map<String, dynamic> json) {
  return OTPReqResponse(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$OTPReqResponseToJson(OTPReqResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
