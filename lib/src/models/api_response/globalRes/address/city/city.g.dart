// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    idCity: json['id_city'] as int,
    name: json['name'] as String,
    hasDistrict: json['has_district'] as int,
    getLocation: json['get_location'] as int,
    defaultLocation: json['default_location'] as String,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id_city': instance.idCity,
      'name': instance.name,
      'has_district': instance.hasDistrict,
      'get_location': instance.getLocation,
      'default_location': instance.defaultLocation,
    };
