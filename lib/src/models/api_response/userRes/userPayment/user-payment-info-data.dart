// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user-payment-info-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserPaymentInfoData extends Equatable {
  @JsonKey(name: 'tblPosCustomers_ID')
  String tblPosCustomersID;
  @JsonKey(name: 'Pay')
  int moneyBuying;
  @JsonKey(name: 'CusType')
  String cusType;
  @JsonKey(name: 'CTypeName')
  String cTypeName;
  @JsonKey(name: 'PriceLevel')
  int priceLevel;
  @JsonKey(name: 'PriceLevelTo')
  int priceLevelTo;

  UserPaymentInfoData({
    this.tblPosCustomersID,
    this.moneyBuying,
    this.cusType,
    this.cTypeName,
    this.priceLevel,
    this.priceLevelTo,
  });

  factory UserPaymentInfoData.fromJson(Map<String, dynamic> json) =>
      _$UserPaymentInfoDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserPaymentInfoDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tblPosCustomers_ID': tblPosCustomersID,
      'Pay': moneyBuying,
      'CusType': cusType,
      'CTypeName': cTypeName,
      'PriceLevel': priceLevel,
      'PriceLevelTo': priceLevelTo,
    };
  }

  @override
  List<Object> get props => [
        tblPosCustomersID,
        moneyBuying,
        cusType,
        cTypeName,
        priceLevel,
        priceLevelTo,
      ];
}
