// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category-sub-group-object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategorySubGroupObjectRes _$CategorySubGroupObjectResFromJson(
    Map<String, dynamic> json) {
  return CategorySubGroupObjectRes(
    id: json['id'] as String,
    code: json['code'] as String,
    name: json['name'] as String,
    // value: json['value'] as String,
    value: (json['value'] as List)?.map((e) => e as String)?.toList(),
    active: json['active'] as bool,
    priority: json['priority'] as int,
    translation: (json['translation'] as List)
        ?.map((e) => e == null ? null : CategoryTranslationRes.fromJson(
            // : CategorySubGroupTranslationRes.fromJson(
            e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategorySubGroupObjectResToJson(
        CategorySubGroupObjectRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'value': instance.value,
      'active': instance.active,
      'priority': instance.priority,
      'translation': instance.translation,
    };
