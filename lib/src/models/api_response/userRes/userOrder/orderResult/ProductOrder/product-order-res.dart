// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product-order-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class ProductOrderRes extends Equatable {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'brand')
  String brand;
  @JsonKey(name: 'perBrand')
  String perBrand;
  @JsonKey(name: 'assets')
  String assets;
  @JsonKey(name: 'discountedPrice')
  String discountedPrice;
  @JsonKey(name: 'orgPrice')
  String orgPrice;
  @JsonKey(name: 'color')
  String color;
  @JsonKey(name: 'size')
  String size;

  ProductOrderRes({
    this.name,
    this.code,
    this.brand,
    this.perBrand,
    this.assets,
    this.discountedPrice,
    this.orgPrice,
    this.color,
    this.size,
  });

  factory ProductOrderRes.fromJson(Map<String, dynamic> json) =>
      _$ProductOrderResFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOrderResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'code': code,
      'brand': brand,
      'perBrand': perBrand,
      'assets': assets,
      'discountedPrice': discountedPrice,
      'orgPrice': orgPrice,
      'color': color,
      'size': size,
    };
  }

  @override
  List<Object> get props => [
        name,
        code,
        brand,
        perBrand,
        assets,
        discountedPrice,
        orgPrice,
        color,
        size,
      ];
}
