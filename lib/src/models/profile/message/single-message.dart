// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/globalRes/time/c-u-d-at-time-res.dart';
import 'package:jeanswest/src/utils/helper/global/convertation-helper.dart';

class SingleMessage {
  String id;

  bool active;
  String title;
  String body;
  String image;
  int version;
  CUDAtTimeRes datetime;
  //
  String createdAtGeoYear;
  String createdAtGeoMonth;
  String createdAtGeoDay;
  //
  Map<String, String> createdAtShamsiDate;
  String createdAtShamsiYear;
  String createdAtShamsiMonth;
  String createdAtShamsiDay;
  //

  //
  bool isReaded = false;

  SingleMessage({
    this.id,
    this.active,
    this.title,
    this.body,
    this.image,
    this.version,
    this.datetime,
  }) {
    isReaded = false;
    // ! Start
    createdAtGeoYear = stringSplitDate(this.datetime.createdAt,
        dateFormat: STANDARD_DATE_FORMAT)['year'];
    createdAtGeoMonth = stringSplitDate(this.datetime.createdAt,
        dateFormat: STANDARD_DATE_FORMAT)['month'];
    createdAtGeoDay = stringSplitDate(this.datetime.createdAt,
        dateFormat: STANDARD_DATE_FORMAT)['day'];
    createdAtShamsiDate = gregorianToShamsi({
      'year': createdAtGeoYear,
      'month': createdAtGeoMonth,
      'day': createdAtGeoDay,
    });
    createdAtShamsiYear = createdAtShamsiDate['year'];
    createdAtShamsiMonth = createdAtShamsiDate['month'];
    createdAtShamsiDay = createdAtShamsiDate['day'];
    // print(
    //     "shamsi date added $createdAtGeoYear/$createdAtGeoMonth/$createdAtGeoDay");
    // print("shamsi date added $createdAtShamsiDate");
  }
}
