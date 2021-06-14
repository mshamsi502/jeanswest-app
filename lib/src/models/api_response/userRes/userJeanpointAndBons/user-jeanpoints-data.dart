// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/userRes/userJeanpointAndBons/promotion-point-data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user-jeanpoints-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserJeanpointsData extends Equatable {
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'startDate')
  String startDate;
  @JsonKey(name: 'expirationDate')
  String expirationDate;

  @JsonKey(name: 'price')
  int price;
  @JsonKey(name: 'promotionPoint')
  PromotionPointData promotionPoint;

//
  UserJeanpointsData({
    this.code,
    this.startDate,
    this.expirationDate,
    this.price,
    this.promotionPoint,
  });
  factory UserJeanpointsData.fromJson(Map<String, dynamic> json) =>
      _$UserJeanpointsDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserJeanpointsDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'startDate': startDate,
      'expirationDate': expirationDate,
      'price': price,
      'promotionPoint': promotionPoint,
    };
  }

  @override
  List<Object> get props => [
        code,
        startDate,
        expirationDate,
        price,
        promotionPoint,
      ];
}
