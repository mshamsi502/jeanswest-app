// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/address-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/ProductOrder/product-order-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/time/exact-time-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/time/period-time-res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user-online-order-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserOnlineOrderRes extends Equatable {
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'receiverName')
  String receiverName;
  @JsonKey(name: 'phoneNumber')
  String phoneNumber;
  @JsonKey(name: 'products')
  List<ProductOrderRes> products;
  @JsonKey(name: 'countProducts')
  List<int> countProducts;
  @JsonKey(name: 'confirmDate')
  ExactTimeRes confirmDate;
  @JsonKey(name: 'recieveDate')
  PeriodTimeRes recieveDate;
  @JsonKey(name: 'paymentDate')
  ExactTimeRes paymentDate;
  @JsonKey(name: 'address')
  AddressInfoRes address;
  @JsonKey(name: 'statusShopping')
  String statusShopping;
  @JsonKey(name: 'statusStepReturn')
  String statusStepReturn;
  @JsonKey(name: 'trackingCode')
  String trackingCode;
  @JsonKey(name: 'paymentPlan')
  String paymentPlan;
  @JsonKey(name: 'isPaid')
  bool isPaid;
  @JsonKey(name: 'paymentTrackingCode')
  String paymentTrackingCode;
  @JsonKey(name: 'sendMethod')
  String sendMethod;
  @JsonKey(name: 'sendPrice')
  String sendPrice;
  //

  UserOnlineOrderRes({
    this.code,
    this.receiverName,
    this.phoneNumber,
    this.products,
    this.countProducts,
    this.confirmDate,
    this.recieveDate,
    this.paymentDate,
    this.address,
    this.statusShopping,
    this.statusStepReturn,
    this.trackingCode,
    this.paymentPlan,
    this.isPaid,
    this.paymentTrackingCode,
    this.sendMethod,
    this.sendPrice,
  });
  factory UserOnlineOrderRes.fromJson(Map<String, dynamic> json) =>
      _$UserOnlineOrderResFromJson(json);

  Map<String, dynamic> toJson() => _$UserOnlineOrderResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'receiverName': receiverName,
      'phoneNumber': phoneNumber,
      'products': products,
      'countProducts': countProducts,
      'confirmDate': confirmDate,
      'recieveDate': recieveDate,
      'paymentDate': paymentDate,
      'address': address,
      'statusShopping': statusShopping,
      'statusStepReturn': statusStepReturn,
      'trackingCode': trackingCode,
      'paymentPlan': paymentPlan,
      'isPaid': isPaid,
      'paymentTrackingCode': paymentTrackingCode,
      'sendMethod': sendMethod,
      'sendPrice': sendPrice,
    };
  }

  @override
  List<Object> get props => [
        code,
        receiverName,
        phoneNumber,
        products,
        countProducts,
        confirmDate,
        recieveDate,
        paymentDate,
        address,
        statusShopping,
        statusStepReturn,
        trackingCode,
        paymentPlan,
        isPaid,
        paymentTrackingCode,
        sendMethod,
        sendPrice,
      ];
}
