// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-main-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMainInfoRes _$UserMainInfoResFromJson(Map<String, dynamic> json) {
  return UserMainInfoRes(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String,
    gender: json['gender'] as String,
    birthDate: json['birthDate'] as String,
  );
}

Map<String, dynamic> _$UserMainInfoResToJson(UserMainInfoRes instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'birthDate': instance.birthDate,
    };
