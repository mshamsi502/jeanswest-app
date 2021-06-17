// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryColor {
  String engName;
  String perName;
  String minHexCode;
  String maxHexCode;
  Widget image;

  CategoryColor({
    @required this.engName,
    @required this.perName,
    this.minHexCode,
    this.maxHexCode,
    @required this.image,
  });
}
