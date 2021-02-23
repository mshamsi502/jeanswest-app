// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banimode-image-product-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanimodeImageProductRes _$BanimodeImageProductResFromJson(
    Map<String, dynamic> json) {
  return BanimodeImageProductRes(
    cartDefault:
        (json['cart_default'] as List)?.map((e) => e as String)?.toList(),
    homeDefault:
        (json['home_default'] as List)?.map((e) => e as String)?.toList(),
    largeDefault:
        (json['large_default'] as List)?.map((e) => e as String)?.toList(),
    smallDefault:
        (json['small_default'] as List)?.map((e) => e as String)?.toList(),
    mediumDefault:
        (json['medium_default'] as List)?.map((e) => e as String)?.toList(),
    thickboxDefault:
        (json['thickbox_default'] as List)?.map((e) => e as String)?.toList(),
    thickboxDefault2x:
        (json['thickbox_default2x'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$BanimodeImageProductResToJson(
        BanimodeImageProductRes instance) =>
    <String, dynamic>{
      'cart_default': instance.cartDefault,
      'home_default': instance.homeDefault,
      'large_default': instance.largeDefault,
      'small_default': instance.smallDefault,
      'medium_default': instance.mediumDefault,
      'thickbox_default': instance.thickboxDefault,
      'thickbox_default2x': instance.thickboxDefault2x,
    };
