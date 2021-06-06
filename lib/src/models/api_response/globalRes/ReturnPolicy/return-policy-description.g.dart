// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return-policy-description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnPolicyDescription _$ReturnPolicyDescriptionFromJson(
    Map<String, dynamic> json) {
  return ReturnPolicyDescription(
    header: json['header'] as String,
    picture: json['picture'] as String,
    phoneNumber: json['phoneNumber'] as String,
    terms: (json['terms'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ReturnPolicyDescriptionToJson(
        ReturnPolicyDescription instance) =>
    <String, dynamic>{
      'header': instance.header,
      'picture': instance.picture,
      'phoneNumber': instance.phoneNumber,
      'terms': instance.terms,
    };
