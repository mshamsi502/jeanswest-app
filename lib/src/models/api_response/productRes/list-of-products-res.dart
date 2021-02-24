// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list-of-products-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class ListOfProductsRes extends Equatable {
  @JsonKey(name: 'data')
  List<SingleProductInfoRes> data;

  ListOfProductsRes({
    this.data,
  });

  factory ListOfProductsRes.fromJson(Map<String, dynamic> json) =>
      _$ListOfProductsResFromJson(json);

  Map<String, dynamic> toJson() => _$ListOfProductsResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'addresses': data,
    };
  }

  @override
  List<Object> get props => [
        data,
      ];
}
