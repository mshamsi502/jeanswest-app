// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) {
  return District(
    idDistrict: json['id_district'] as int,
    name: json['name'] as String,
    fullName: json['full_name'] as String,
    code: json['code'] as int,
    defaultLocation: json['default_location'] as String,
  );
}

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'id_district': instance.idDistrict,
      'name': instance.name,
      'full_name': instance.fullName,
      'code': instance.code,
      'default_location': instance.defaultLocation,
    };
