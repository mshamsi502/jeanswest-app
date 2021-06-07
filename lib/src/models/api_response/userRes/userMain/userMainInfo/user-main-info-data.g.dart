// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-main-info-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMainInfoData _$UserMainInfoDataFromJson(Map<String, dynamic> json) {
  return UserMainInfoData(
    code: json['code'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String,
    gender: json['gender'] as int,
    birthDate: json['birthDate'] as String,
    erpPartnerShipCode: json['erpPartnerShipCode'] as String,
  );
}

Map<String, dynamic> _$UserMainInfoDataToJson(UserMainInfoData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'birthDate': instance.birthDate,
      'erpPartnerShipCode': instance.erpPartnerShipCode,
    };
