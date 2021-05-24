// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single-product-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleProductInfoRes _$SingleProductInfoResFromJson(Map<String, dynamic> json) {
  return SingleProductInfoRes(
    quantity: json['quantity'] as int,
    barcode: json['barcode'] as String,
    styleCode: json['styleCode'] as String,
    basePrice: json['basePrice'] as int,
    salePrice: json['salePrice'] as int,
    banimodeDetails: json['banimodeDetails'] == null
        ? null
        : BanimodeDetailsProductRes.fromJson(
            json['banimodeDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SingleProductInfoResToJson(
        SingleProductInfoRes instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'barcode': instance.barcode,
      'styleCode': instance.styleCode,
      'basePrice': instance.basePrice,
      'salePrice': instance.salePrice,
      'banimodeDetails': instance.banimodeDetails,
    };
