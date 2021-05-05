// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) {
  return Province(
    name: json['name'] as String,
    idState: json['id_state'] as int,
  );
}

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'id_state': instance.idState,
      'name': instance.name,
    };
