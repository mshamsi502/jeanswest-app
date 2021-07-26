// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-tbl-pos-cust-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTblPosCustRes _$UserTblPosCustResFromJson(Map<String, dynamic> json) {
  return UserTblPosCustRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: json['data'] as List,
  );
}

Map<String, dynamic> _$UserTblPosCustResToJson(UserTblPosCustRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
