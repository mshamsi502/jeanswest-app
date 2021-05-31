// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return-policy-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnPolicyData _$ReturnPolicyDataFromJson(Map<String, dynamic> json) {
  return ReturnPolicyData(
    header: json['header'] as String,
    picture: json['picture'] as String,
    phoneNumber: json['phoneNumber'] as String,
    terms: (json['terms'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ReturnPolicyDataToJson(ReturnPolicyData instance) =>
    <String, dynamic>{
      'header': instance.header,
      'picture': instance.picture,
      'phoneNumber': instance.phoneNumber,
      'terms': instance.terms,
    };
