// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/utils/helper/global/convertation-helper.dart';

class SingleMessage {
  int code;
  String engTitle;
  String perTitle;
  String engSender;
  String perSender;
  String pictureAssets;
  String text;
  List<String> description;
  int price;
  int minShopping;
  List<String> perCategory;
  List<String> engCategory;
  String startDate;
  //
  String startGeoYear;
  String startGeoMonth;
  String startGeoDay;
  //
  Map<String, String> startShamsiDate;
  String startShamsiYear;
  String startShamsiMonth;
  String startShamsiDay;
  //
  String endDate;

  String endGeoYear;
  String endGeoMonth;
  String endGeoDay;
  //
  Map<String, String> endShamsiDate;
  String endShamsiYear;
  String endShamsiMonth;
  String endShamsiDay;

  //
  String sendDate;

  String sendGeoYear;
  String sendGeoMonth;
  String sendGeoDay;
  //
  Map<String, String> sendShamsiDate;
  String sendShamsiYear;
  String sendShamsiMonth;
  String sendShamsiDay;
  //
  String sendHour;
  String sendMinute;
  String sendSecond;

  //
  bool isReaded = false;

  SingleMessage({
    this.code,
    this.engTitle,
    this.perTitle,
    this.engSender,
    this.perSender,
    this.pictureAssets,
    this.text,
    this.description,
    this.price,
    this.minShopping,
    this.engCategory,
    this.perCategory,
    this.startDate,
    this.endDate,
    this.sendDate,
  }) {
    isReaded = false;
    // ! Start
    startGeoYear = stringSplitDate(this.startDate)['year'];
    startGeoMonth = stringSplitDate(this.startDate)['month'];
    startGeoDay = stringSplitDate(this.startDate)['day'];
    startShamsiDate = gregorianToShamsi({
      'year': startGeoYear,
      'month': startGeoMonth,
      'day': startGeoDay,
    });
    startShamsiYear = startShamsiDate['year'];
    startShamsiMonth = startShamsiDate['month'];
    startShamsiDay = startShamsiDate['day'];
    // ! End
    endGeoYear = stringSplitDate(this.endDate)['year'];
    endGeoMonth = stringSplitDate(this.endDate)['month'];
    endGeoDay = stringSplitDate(this.endDate)['day'];
    //
    endShamsiDate = gregorianToShamsi({
      'year': endGeoYear,
      'month': endGeoMonth,
      'day': endGeoDay,
    });
    endShamsiYear = endShamsiDate['year'];
    endShamsiMonth = endShamsiDate['month'];
    endShamsiDay = endShamsiDate['day'];

    // ! Send
    sendGeoYear = stringSplitDate(this.sendDate)['year'];
    sendGeoMonth = stringSplitDate(this.sendDate)['month'];
    sendGeoDay = stringSplitDate(this.sendDate)['day'];
    sendHour = stringSplitDate(this.sendDate)['hour'];
    sendMinute = stringSplitDate(this.sendDate)['min'];
    sendSecond = stringSplitDate(this.sendDate)['sec'];
    //
    sendShamsiDate = gregorianToShamsi({
      'year': sendGeoYear,
      'month': sendGeoMonth,
      'day': sendGeoDay,
    });
    sendShamsiYear = sendShamsiDate['year'];
    sendShamsiMonth = sendShamsiDate['month'];
    sendShamsiDay = sendShamsiDate['day'];
  }
}
