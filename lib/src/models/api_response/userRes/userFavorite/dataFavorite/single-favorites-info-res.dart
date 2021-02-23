// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/productRes/banimode/banimode-detail-product-res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single-favorites-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class SingleFavoriteInfoRes extends Equatable {
  @JsonKey(name: 'active')
  bool active;
  @JsonKey(name: 'quantity')
  int quantity;
  @JsonKey(name: 'barcode')
  String barcode;
  @JsonKey(name: 'basePrice')
  int basePrice;
  @JsonKey(name: 'salePrice')
  int salePrice;
  @JsonKey(name: 'banimodeCode')
  int banimodeCode;
  @JsonKey(name: 'banimodeDetails')
  BanimodeDetailsProductRes banimodeDetails;

  SingleFavoriteInfoRes({
    this.active,
    this.quantity,
    this.barcode,
    this.basePrice,
    this.salePrice,
    this.banimodeCode,
    this.banimodeDetails,
  });

  factory SingleFavoriteInfoRes.fromJson(Map<String, dynamic> json) =>
      _$SingleFavoriteInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$SingleFavoriteInfoResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'active': active,
      'quantity': quantity,
      'barcode': barcode,
      'basePrice': basePrice,
      'salePrice': salePrice,
      'banimodeCode': banimodeCode,
      'banimodeDetails': banimodeDetails,
    };
  }

  @override
  List<Object> get props => [
        active,
        quantity,
        barcode,
        basePrice,
        salePrice,
        banimodeCode,
        banimodeDetails,
      ];
}
