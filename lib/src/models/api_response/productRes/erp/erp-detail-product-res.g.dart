// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'erp-detail-product-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErpDetailsProductRes _$ErpDetailsProductResFromJson(Map<String, dynamic> json) {
  return ErpDetailsProductRes(
    name: json['name'] as String,
    size: json['size'] as String,
    brand: json['brand'] as String,
    color: json['color'] as String,
    group: json['group'] as String,
    gender: json['gender'] as String,
    nameFA: json['nameFA'] as String,
    cutting: json['cutting'] as String,
    styleFA: json['styleFA'] as String,
    ageGroup: json['ageGroup'] as String,
    category: json['category'] as String,
    material: json['material'] as String,
    subGroup: json['subGroup'] as String,
    colorCode: json['colorCode'] as String,
    colorFamily: json['colorFamily'] as String,
    seasonCode1: json['seasonCode1'] as String,
    seasonCode2: json['seasonCode2'] as String,
  );
}

Map<String, dynamic> _$ErpDetailsProductResToJson(
        ErpDetailsProductRes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'brand': instance.brand,
      'color': instance.color,
      'group': instance.group,
      'gender': instance.gender,
      'nameFA': instance.nameFA,
      'cutting': instance.cutting,
      'styleFA': instance.styleFA,
      'ageGroup': instance.ageGroup,
      'category': instance.category,
      'material': instance.material,
      'subGroup': instance.subGroup,
      'colorCode': instance.colorCode,
      'colorFamily': instance.colorFamily,
      'seasonCode1': instance.seasonCode1,
      'seasonCode2': instance.seasonCode2,
    };
