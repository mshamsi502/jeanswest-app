// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

// ignore: must_be_immutable

import 'package:flutter/material.dart';
import 'package:jeanswest/src/utils/helper/global/convertation-helper.dart';
import 'package:shamsi_date/shamsi_date.dart';

class Coupon {
  final int code;
  final String engName;
  final String perName;
  final List<String> description;
  final int price;
  final int minShopping;
  final String startDate;
  final String endDate;
  //
  String yearOfStartDate;
  String monthOfStartDate;
  String dayOfStartDate;
  String yearOfEndDate;
  String monthOfEndDate;
  String dayOfEndDate;

  Coupon({
    @required this.code,
    @required this.engName,
    @required this.perName,
    @required this.description,
    @required this.price,
    @required this.minShopping,
    @required this.startDate,
    @required this.endDate,
    //
    this.yearOfStartDate,
    this.monthOfStartDate,
    this.dayOfStartDate,
    //
    this.yearOfEndDate,
    this.monthOfEndDate,
    this.dayOfEndDate,
  }) {
    yearOfStartDate = stringSplitDate(startDate)['year'];
    monthOfStartDate = stringSplitDate(startDate)['month'];
    dayOfStartDate = stringSplitDate(startDate)['day'];
    // print('$yearOfStartDate-$monthOfStartDate-$dayOfStartDate');
    if (int.parse(stringSplitDate(startDate)['year'].substring(0, 1)) < 15) {
      Gregorian gregorian = new Gregorian(
        int.parse(stringSplitDate(startDate)['year']),
        int.parse(stringSplitDate(startDate)['month']),
        int.parse(stringSplitDate(startDate)['day']),
      );
      Jalali jalali = gregorian.toJalali();
      yearOfStartDate = jalali.year.toString();
      monthOfStartDate = jalali.month.toString();
      dayOfStartDate = jalali.day.toString();
    }
    // print('$yearOfStartDate-$monthOfStartDate-$dayOfStartDate');

    yearOfEndDate = stringSplitDate(endDate)['year'];
    monthOfEndDate = stringSplitDate(endDate)['month'];
    dayOfEndDate = stringSplitDate(endDate)['day'];
    if (int.parse(stringSplitDate(endDate)['year'].substring(0, 1)) < 15) {
      Gregorian gregorian = new Gregorian(
        int.parse(stringSplitDate(endDate)['year']),
        int.parse(stringSplitDate(endDate)['month']),
        int.parse(stringSplitDate(endDate)['day']),
      );
      Jalali jalali = gregorian.toJalali();
      yearOfEndDate = jalali.year.toString();
      monthOfEndDate = jalali.month.toString();
      dayOfEndDate = jalali.day.toString();
    }
  }
}
