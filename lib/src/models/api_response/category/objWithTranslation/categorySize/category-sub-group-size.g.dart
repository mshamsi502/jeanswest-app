// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category-sub-group-size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategorySubGroupSizeRes _$CategorySubGroupSizeResFromJson(
    Map<String, dynamic> json) {
  return CategorySubGroupSizeRes(
    name: json['name'] as String,
    value: json['value'] as String,
    active: json['active'] as bool,
    subGroup: json['subGroup'] as String,
    priority: json['priority'] as int,
    translation: (json['translation'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryTranslationRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategorySubGroupSizeResToJson(
        CategorySubGroupSizeRes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'active': instance.active,
      'subGroup': instance.subGroup,
      'priority': instance.priority,
      'translation': instance.translation,
    };
