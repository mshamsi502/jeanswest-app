// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/ProductOrder/product-order-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/time/exact-time-res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user-offline-order-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserOfflineOrderRes extends Equatable {
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'receiverName')
  String receiverName;
  @JsonKey(name: 'products')
  List<ProductOrderRes> products;
  @JsonKey(name: 'countProducts')
  List<int> countProducts;
  @JsonKey(name: 'returnedProduct')
  List<bool> returnedProduct;
  @JsonKey(name: 'longBranchName')
  String longBranchName;
  @JsonKey(name: 'shortBranchName')
  String shortBranchName;
  @JsonKey(name: 'shoppingDate')
  ExactTimeRes shoppingDate;
  @JsonKey(name: 'paymentDate')
  ExactTimeRes paymentDate;
  @JsonKey(name: 'paymentPlan')
  List<String> paymentPlan;
  //

  UserOfflineOrderRes({
    this.code,
    this.receiverName,
    this.products,
    this.countProducts,
    this.returnedProduct,
    this.longBranchName,
    this.shortBranchName,
    this.shoppingDate,
    this.paymentDate,
    this.paymentPlan,
  });

  factory UserOfflineOrderRes.fromJson(Map<String, dynamic> json) =>
      _$UserOfflineOrderResFromJson(json);

  Map<String, dynamic> toJson() => _$UserOfflineOrderResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'receiverName': receiverName,
      'products': products,
      'countProducts': countProducts,
      'returnedProduct': returnedProduct,
      'longBranchName': longBranchName,
      'shortBranchName': shortBranchName,
      'shoppingDate': shoppingDate,
      'paymentDate': paymentDate,
      'paymentPlan': paymentPlan,
    };
  }

  @override
  List<Object> get props => [
        code,
        receiverName,
        products,
        countProducts,
        returnedProduct,
        longBranchName,
        shortBranchName,
        shoppingDate,
        paymentDate,
        paymentPlan,
      ];
}
