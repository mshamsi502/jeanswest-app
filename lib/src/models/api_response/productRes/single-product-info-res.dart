// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/productRes/banimode/banimode-detail-product-res.dart';
import 'package:jeanswest/src/models/api_response/productRes/erp/erp-detail-product-res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single-product-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class SingleProductInfoRes extends Equatable {
  // @JsonKey(name: 'active')
  // bool active;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'size')
  String size;
  @JsonKey(name: 'quantity')
  int quantity;
  @JsonKey(name: 'barcode')
  String barcode;
  @JsonKey(name: 'sku')
  String sku;
  @JsonKey(name: 'styleCode')
  String styleCode;
  @JsonKey(name: 'basePrice')
  int basePrice;
  @JsonKey(name: 'salePrice')
  int salePrice;
  @JsonKey(name: 'banimodeDetails')
  BanimodeDetailsProductRes banimodeDetails;

  @JsonKey(name: 'erpDetails')
  ErpDetailsProductRes erpDetails;

  SingleProductInfoRes({
    // this.active,
    this.title,
    this.size,
    this.quantity,
    this.barcode,
    this.sku,
    this.styleCode,
    this.basePrice,
    this.salePrice,
    this.banimodeDetails,
    this.erpDetails,
  });

  factory SingleProductInfoRes.fromJson(Map<String, dynamic> json) =>
      _$SingleProductInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$SingleProductInfoResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'active': active,
      'title': title,
      'size': size,
      'quantity': quantity,
      'barcode': barcode,
      'sku': sku,
      'styleCode': styleCode,
      'basePrice': basePrice,
      'salePrice': salePrice,
      'banimodeDetails': banimodeDetails,
      'erpDetails': erpDetails,
    };
  }

  @override
  List<Object> get props => [
        // active,
        title,
        size,
        quantity,
        barcode,
        sku,
        styleCode,
        basePrice,
        salePrice,
        banimodeDetails,
        erpDetails,
      ];
}
