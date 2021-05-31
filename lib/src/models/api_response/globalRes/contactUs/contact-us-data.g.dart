// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact-us-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsData _$ContactUsDataFromJson(Map<String, dynamic> json) {
  return ContactUsData(
    email: json['email'] as String,
    phone: json['phone'] as String,
    fax: json['fax'] as String,
  );
}

Map<String, dynamic> _$ContactUsDataToJson(ContactUsData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'fax': instance.fax,
    };
