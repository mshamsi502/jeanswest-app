// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/productRes/banimode/banimode-detail-product-res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single-product-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class SingleProductInfoRes extends Equatable {
  // @JsonKey(name: 'active')
  // bool active;
  @JsonKey(name: 'quantity')
  int quantity;
  @JsonKey(name: 'barcode')
  String barcode;
  @JsonKey(name: 'styleCode')
  String styleCode;
  @JsonKey(name: 'basePrice')
  int basePrice;
  @JsonKey(name: 'salePrice')
  int salePrice;
  @JsonKey(name: 'banimodeDetails')
  BanimodeDetailsProductRes banimodeDetails;

  SingleProductInfoRes({
    // this.active,
    this.quantity,
    this.barcode,
    this.styleCode,
    this.basePrice,
    this.salePrice,
    this.banimodeDetails,
  });

  factory SingleProductInfoRes.fromJson(Map<String, dynamic> json) =>
      _$SingleProductInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$SingleProductInfoResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'active': active,
      'quantity': quantity,
      'barcode': barcode,
      'styleCode': styleCode,
      'basePrice': basePrice,
      'salePrice': salePrice,
      'banimodeDetails': banimodeDetails,
    };
  }

  @override
  List<Object> get props => [
        // active,
        quantity,
        barcode,
        styleCode,
        basePrice,
        salePrice,
        banimodeDetails,
      ];
}
