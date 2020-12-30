// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_profile
// *   Created Date & Time :  2020-11-25  ,  02:36 PM
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
