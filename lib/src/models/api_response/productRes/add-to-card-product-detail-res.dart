// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:jeanswest/src/models/api_response/productRes/banimode/banimode-detail-product-res.dart';

part 'add-to-card-product-detail-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class AddToCardProductDetailRes extends Equatable {
  @JsonKey(name: 'sizeGuid')
  List<List<String>> sizeGuid;
  @JsonKey(name: 'allColor')
  List<BanimodeDetailsProductRes> allColorsBanimodeDetails;

  AddToCardProductDetailRes({
    this.sizeGuid,
    this.allColorsBanimodeDetails,
  });

  factory AddToCardProductDetailRes.fromJson(Map<String, dynamic> json) =>
      _$AddToCardProductDetailResFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCardProductDetailResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sizeGuid': sizeGuid,
      'allColor': allColorsBanimodeDetails,
    };
  }

  @override
  List<Object> get props => [
        sizeGuid,
        allColorsBanimodeDetails,
      ];
}
