// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-order-data-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOrderDataRes _$UserOrderDataResFromJson(Map<String, dynamic> json) {
  return UserOrderDataRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : UserOrderResultRes.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserOrderDataResToJson(UserOrderDataRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
