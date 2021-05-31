// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return-policy-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnPolicyRes _$ReturnPolicyResFromJson(Map<String, dynamic> json) {
  return ReturnPolicyRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ReturnPolicyData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReturnPolicyResToJson(ReturnPolicyRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
