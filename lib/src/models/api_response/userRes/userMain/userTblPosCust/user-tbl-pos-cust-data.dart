// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user-tbl-pos-cust-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserTblPosCustData extends Equatable {
  @JsonKey(name: 'tblPosCustomers_ID')
  String tblPosCustomersID;
  @JsonKey(name: 'Pay')
  String pay;
  @JsonKey(name: 'CTypeName')
  String cTypeName;
  @JsonKey(name: 'PriceLevel')
  String priceLevel;
  @JsonKey(name: 'PriceLevelTo')
  String priceLevelTo;

  //
  UserTblPosCustData({
    this.tblPosCustomersID,
    this.pay,
    this.cTypeName,
    this.priceLevel,
    this.priceLevelTo,
  });

  factory UserTblPosCustData.fromJson(Map<String, dynamic> json) =>
      _$UserTblPosCustDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserTblPosCustDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tblPosCustomers_ID': tblPosCustomersID,
      'Pay': pay,
      'CTypeName': cTypeName,
      'PriceLevel': priceLevel,
      'PriceLevelTo': priceLevelTo,
    };
  }

  @override
  List<Object> get props => [
        tblPosCustomersID,
        pay,
        cTypeName,
        priceLevel,
        priceLevelTo,
      ];
}
