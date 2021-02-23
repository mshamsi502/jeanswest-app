// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single-favorites-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleFavoriteInfoRes _$SingleFavoriteInfoResFromJson(
    Map<String, dynamic> json) {
  return SingleFavoriteInfoRes(
    active: json['active'] as bool,
    quantity: json['quantity'] as int,
    barcode: json['barcode'] as String,
    basePrice: json['basePrice'] as int,
    salePrice: json['salePrice'] as int,
    banimodeCode: json['banimodeCode'] as int,
    banimodeDetails: json['banimodeDetails'] == null
        ? null
        : BanimodeDetailsProductRes.fromJson(
            json['banimodeDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SingleFavoriteInfoResToJson(
        SingleFavoriteInfoRes instance) =>
    <String, dynamic>{
      'active': instance.active,
      'quantity': instance.quantity,
      'barcode': instance.barcode,
      'basePrice': instance.basePrice,
      'salePrice': instance.salePrice,
      'banimodeCode': instance.banimodeCode,
      'banimodeDetails': instance.banimodeDetails,
    };
