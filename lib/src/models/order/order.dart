// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

// ignore: must_be_immutable

import 'package:flutter/material.dart';
import 'package:jeanswest/src/models/order/exact_time_order.dart';
import 'package:jeanswest/src/models/order/period_time_order.dart';
import 'package:jeanswest/src/models/product/product.dart';
import 'package:jeanswest/src/models/address/address.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

class Order {
  final String code;
  final String receiverName;
  final List<Product> products;
  final List<int> countProducts;
  //
  final String sendMethod;
  //
  final ExactTimeOrder confirmDate;
  final PeriodTimeOrder recieveDate;
  final ExactTimeOrder paymentDate;
  //
  final String statusShopping;
  final String statusStep;
  //
  final Address address;
  final String phoneNumber;
  final String trackingCode;
  final String paymentPlan;
  final String paymentTrackingCode;
  //
  String orgPrice;
  // final String orgPrice;
  final String sendPrice;
  String discountedPrice;
  int finalSendPrice;
  // String discountedPrice;
  final List<String> usedCoupons;
  String payablePrice;
  // String payablePrice;
  //

  Order({
    @required this.receiverName,
    @required this.phoneNumber,
    @required this.countProducts,
    @required this.sendMethod,
    @required this.confirmDate,
    @required this.recieveDate,
    @required this.paymentDate,
    @required this.statusShopping,
    @required this.statusStep,
    @required this.address,
    @required this.trackingCode,
    @required this.paymentPlan,
    @required this.paymentTrackingCode,
    @required this.code,
    @required this.products,
    // @required this.orgPrice,
    this.sendPrice,
    this.finalSendPrice,
    // @required this.discountedPrice,
    this.usedCoupons,
    // @required this.payablePrice,
  }) {
    int sumOrgPrice = 0;
    int sumDiscountedPrice = 0;
    this.finalSendPrice =
        checkFreeSend(this.sendPrice) ? 0 : int.parse(this.sendPrice);

    // int sumPayablePrice = 0;
    for (var i = 0; i < this.products.length; i++) {
      sumOrgPrice = sumOrgPrice + int.parse(this.products[i].orgPrice);
      sumDiscountedPrice =
          sumDiscountedPrice + int.parse(this.products[i].discountedPrice);
    }
    this.orgPrice = sumOrgPrice.toString();
    this.discountedPrice = sumDiscountedPrice.toString();
    this.payablePrice = (sumOrgPrice + finalSendPrice ?? 0).toString();
  }
}
