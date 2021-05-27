// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banimode-specific-price-product-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class BanimodeSpecificPriceProductRes extends Equatable {
  @JsonKey(name: 'specific_price')
  int specificPrice;
  @JsonKey(name: 'discount_amount')
  int discountAmount;
  @JsonKey(name: 'discount_percent')
  int discountPercent;
  @JsonKey(name: 'from')
  String from;
  @JsonKey(name: 'to')
  String to;

  BanimodeSpecificPriceProductRes({
    this.specificPrice,
    this.discountAmount,
    this.discountPercent,
    this.from,
    this.to,
  });

  factory BanimodeSpecificPriceProductRes.fromJson(Map<String, dynamic> json) =>
      _$BanimodeSpecificPriceProductResFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BanimodeSpecificPriceProductResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'specific_price': specificPrice,
      'discount_amount': discountAmount,
      'discount_percent': discountPercent,
      'from': from,
      'to': to,
    };
  }

  @override
  List<Object> get props => [
        specificPrice,
        discountAmount,
        discountPercent,
        from,
        to,
      ];
}
