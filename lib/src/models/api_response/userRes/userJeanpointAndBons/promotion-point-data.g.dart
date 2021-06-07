// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion-point-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionPointData _$PromotionPointDataFromJson(Map<String, dynamic> json) {
  return PromotionPointData(
    name: json['name'] as String,
    description: json['description'] == null
        ? null
        : PromotionDescriptionData.fromJson(
            json['description'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PromotionPointDataToJson(PromotionPointData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };
