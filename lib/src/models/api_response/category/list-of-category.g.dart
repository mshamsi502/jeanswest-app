// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list-of-category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfCategory _$ListOfCategoryFromJson(Map<String, dynamic> json) {
  return ListOfCategory(
    group: (json['group'] as List)?.map((e) => e as String)?.toList(),
    subGroup: (json['subGroup'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    size: (json['size'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    gender: (json['gender'] as List)?.map((e) => e as String)?.toList(),
    ageGroup: (json['ageGroup'] as List)?.map((e) => e as String)?.toList(),
    colorFamily:
        (json['colorFamily'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ListOfCategoryToJson(ListOfCategory instance) =>
    <String, dynamic>{
      'group': instance.group,
      'subGroup': instance.subGroup,
      'size': instance.size,
      'gender': instance.gender,
      'ageGroup': instance.ageGroup,
      'colorFamily': instance.colorFamily,
    };
