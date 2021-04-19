// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product-order-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOrderRes _$ProductOrderResFromJson(Map<String, dynamic> json) {
  return ProductOrderRes(
    name: json['name'] as String,
    code: json['code'] as String,
    brand: json['brand'] as String,
    perBrand: json['perBrand'] as String,
    assets: json['assets'] as String,
    discountedPrice: json['discountedPrice'] as String,
    orgPrice: json['orgPrice'] as String,
    color: json['color'] as String,
    size: json['size'] as String,
  );
}

Map<String, dynamic> _$ProductOrderResToJson(ProductOrderRes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'brand': instance.brand,
      'perBrand': instance.perBrand,
      'assets': instance.assets,
      'discountedPrice': instance.discountedPrice,
      'orgPrice': instance.orgPrice,
      'color': instance.color,
      'size': instance.size,
    };
