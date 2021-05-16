// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-addresses-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddressesInfoRes _$UserAddressesInfoResFromJson(Map<String, dynamic> json) {
  return UserAddressesInfoRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : AddressInfoRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserAddressesInfoResToJson(
        UserAddressesInfoRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
