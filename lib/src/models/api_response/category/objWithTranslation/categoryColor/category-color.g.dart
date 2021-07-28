// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category-color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryColorRes _$CategoryColorResFromJson(Map<String, dynamic> json) {
  return CategoryColorRes(
    id: json['id'] as String,
 
    code: json['code'] as String,
    name: json['name'] as String,
    color: json['color'] as String,
    image: json['image'] as String,
    value: (json['value'] as List)?.map((e) => e as String)?.toList(),
    active: json['active'] as bool,
    priority: json['priority'] as int,
    translation: (json['translation'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryTranslationRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryColorResToJson(CategoryColorRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'color': instance.color,
      'image': instance.image,
      'value': instance.value,
      'active': instance.active,
      'priority': instance.priority,
      'translation': instance.translation,
    };
