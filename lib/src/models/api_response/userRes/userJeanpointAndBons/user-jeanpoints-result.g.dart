// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-jeanpoints-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJeanpointsResult _$UserJeanpointsResultFromJson(Map<String, dynamic> json) {
  return UserJeanpointsResult(
    code: json['code'] as int,
    engName: json['engName'] as String,
    perName: json['perName'] as String,
    description:
        (json['description'] as List)?.map((e) => e as String)?.toList(),
    price: json['price'] as int,
    minShopping: json['minShopping'] as int,
    startDate: json['startDate'] as String,
    endDate: json['endDate'] as String,
  );
}

Map<String, dynamic> _$UserJeanpointsResultToJson(
        UserJeanpointsResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'engName': instance.engName,
      'perName': instance.perName,
      'description': instance.description,
      'price': instance.price,
      'minShopping': instance.minShopping,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
