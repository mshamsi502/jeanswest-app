// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_profile
// *   Created Date & Time :  2020-11-25  ,  02:36 PM
// ****************************************************************************

// ignore: must_be_immutable

import 'package:flutter/material.dart';

class NotificationMessage {
  final String title;
  final Widget icon;
  final String pictureAssets;
  final String text;
  final List<String> conditions;

  final String price;
  final String dayOfSend;
  final String monthOfSend;
  final String yearOfSend;
  final String hourOfSend;
  final String minOfSend;

  NotificationMessage({
    @required this.title,
    this.icon,
    this.pictureAssets,
    @required this.text,
    this.conditions,
    this.price,
    @required this.dayOfSend,
    @required this.monthOfSend,
    @required this.yearOfSend,
    @required this.hourOfSend,
    @required this.minOfSend,
  });
}
