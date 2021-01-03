// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

// ignore: must_be_immutable

import 'package:flutter/cupertino.dart';

class Product {
  final String code;
  final String name;
  final String brand;
  final String assets;
  final String orgPrice;
  final String discountedPrice;
  final String color;
  final Color colorCode;
  final String size;
  final List<String> attributes;

  Product({
    @required this.name,
    @required this.code,
    @required this.brand,
    this.assets,
    this.orgPrice,
    @required this.discountedPrice,
    this.color,
    this.colorCode,
    this.size,
    this.attributes,
  });
}
