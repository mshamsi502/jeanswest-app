// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return-policy-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnPolicyData _$ReturnPolicyDataFromJson(Map<String, dynamic> json) {
  return ReturnPolicyData(
    condition: json['condition'] as String,
    description: json['description'] == null
        ? null
        : ReturnPolicyDescription.fromJson(
            json['description'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReturnPolicyDataToJson(ReturnPolicyData instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'description': instance.description,
    };
