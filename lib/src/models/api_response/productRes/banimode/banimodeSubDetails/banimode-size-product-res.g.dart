// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banimode-size-product-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanimodeSizeProductRes _$BanimodeSizeProductResFromJson(
    Map<String, dynamic> json) {
  return BanimodeSizeProductRes(
    name: json['name'] as String,
    active: json['active'] as int,
    idSize: json['id_size'] as int,
    position: json['position'] as int,
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$BanimodeSizeProductResToJson(
        BanimodeSizeProductRes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'active': instance.active,
      'id_size': instance.idSize,
      'position': instance.position,
      'quantity': instance.quantity,
    };
