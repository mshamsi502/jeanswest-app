// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-payment-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPaymentInfoRes _$UserPaymentInfoResFromJson(Map<String, dynamic> json) {
  return UserPaymentInfoRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : UserPaymentInfoData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserPaymentInfoResToJson(UserPaymentInfoRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
