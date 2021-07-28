// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single-product-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleProductInfoRes _$SingleProductInfoResFromJson(Map<String, dynamic> json) {
  return SingleProductInfoRes(
    title: json['title'] as String,
    size: json['size'] as String,
    quantity: json['quantity'] as int,
    barcode: json['barcode'] as String,
    sku: json['sku'] as String,
    styleCode: json['styleCode'] as String,
    basePrice: json['basePrice'] as int,
    salePrice: json['salePrice'] as int,
    banimodeDetails: json['banimodeDetails'] == null
        ? null
        : BanimodeDetailsProductRes.fromJson(
            json['banimodeDetails'] as Map<String, dynamic>),
    erpDetails: json['erpDetails'] == null
        ? null
        : ErpDetailsProductRes.fromJson(
            json['erpDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SingleProductInfoResToJson(
        SingleProductInfoRes instance) =>
    <String, dynamic>{
      'title': instance.title,
      'size': instance.size,
      'quantity': instance.quantity,
      'barcode': instance.barcode,
      'sku': instance.sku,
      'styleCode': instance.styleCode,
      'basePrice': instance.basePrice,
      'salePrice': instance.salePrice,
      'banimodeDetails': instance.banimodeDetails,
      'erpDetails': instance.erpDetails,
    };
