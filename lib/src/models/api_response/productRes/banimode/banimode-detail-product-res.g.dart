// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banimode-detail-product-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanimodeDetailsProductRes _$BanimodeDetailsProductResFromJson(
    Map<String, dynamic> json) {
  return BanimodeDetailsProductRes(
    productSizeGuide: (json['product_size_guide'] as List)
        ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
        ?.toList(),
    size: (json['size'] as List)
        ?.map((e) => e == null
            ? null
            : BanimodeSizeProductRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    images: json['images'] == null
        ? null
        : BanimodeImageProductRes.fromJson(
            json['images'] as Map<String, dynamic>),
    idColor: json['id_color'] as int,
    colorName: json['color_name'] as String,
    colorValue: json['color_value'] as String,
    productName: json['product_name'] as String,
    productManufacturerName: json['product_manufacturer_name'] as String,
    productManufacturerEnName: json['product_manufacturer_en_name'] as String,
  );
}

Map<String, dynamic> _$BanimodeDetailsProductResToJson(
        BanimodeDetailsProductRes instance) =>
    <String, dynamic>{
      'product_size_guide': instance.productSizeGuide,
      'size': instance.size,
      'images': instance.images,
      'id_color': instance.idColor,
      'color_name': instance.colorName,
      'color_value': instance.colorValue,
      'product_name': instance.productName,
      'product_manufacturer_name': instance.productManufacturerName,
      'product_manufacturer_en_name': instance.productManufacturerEnName,
    };
