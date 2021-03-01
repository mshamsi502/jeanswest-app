// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banimode-specific-price-product-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanimodeSpecificPriceProductRes _$BanimodeSpecificPriceProductResFromJson(
    Map<String, dynamic> json) {
  return BanimodeSpecificPriceProductRes(
    specificPrice: json['specific_price'] as int,
    discountAmount: json['discount_amount'] as int,
    discountPercent: json['discount_percent'] as int,
    from: json['from'] as String,
    to: json['to'] as String,
  );
}

Map<String, dynamic> _$BanimodeSpecificPriceProductResToJson(
        BanimodeSpecificPriceProductRes instance) =>
    <String, dynamic>{
      'specific_price': instance.specificPrice,
      'discount_amount': instance.discountAmount,
      'discount_percent': instance.discountPercent,
      'from': instance.from,
      'to': instance.to,
    };
