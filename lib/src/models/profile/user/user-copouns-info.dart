// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

// ignore: must_be_immutable
import 'package:easy_localization/easy_localization.dart';
import 'package:jeanswest/src/models/api_response/userRes/userJeanpointAndBons/promotion-point-data.dart';
import 'package:jeanswest/src/utils/helper/global/convertation-helper.dart';

class UserCouponsInfo {
  String code;
  String startDate;
  String expirationDate;
  int price;
  PromotionPointData promotionPoint;
  //
  String startYearGeo;
  String startMonthGeo;
  String startDayGeo;
  String startHourGeo;
  String startMinGeo;
  //
  String startYearShamsi;
  String startMonthShamsi;
  String startDayShamsi;
  String startHourShamsi;
  String startMinShamsi;
  //
  String endYearGeo;
  String endMonthGeo;
  String endDayGeo;
  String endHourGeo;
  String endMinGeo;
  //
  String endYearShamsi;
  String endMonthShamsi;
  String endDayShamsi;
  String endHourShamsi;
  String endMinShamsi;
//
  UserCouponsInfo({
    this.code,
    this.startDate,
    this.expirationDate,
    this.price,
    this.promotionPoint,
    //
    this.startYearGeo,
    this.startMonthGeo,
    this.startDayGeo,
    this.startHourGeo,
    this.startMinGeo,
    this.startYearShamsi,
    this.startMonthShamsi,
    this.startDayShamsi,
    this.startHourShamsi,
    this.startMinShamsi,
    this.endYearGeo,
    this.endMonthGeo,
    this.endDayGeo,
    this.endHourGeo,
    this.endMinGeo,
    this.endYearShamsi,
    this.endMonthShamsi,
    this.endDayShamsi,
    this.endHourShamsi,
    this.endMinShamsi,
  }) {
    if (this.startDate != null) {
      print("this.startDate : ${this.startDate}");
      DateTime start =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(this.startDate);
      print("satart : $start");
      startYearGeo = start.year.toString();
      startMonthGeo = start.month.toString();
      startDayGeo = start.day.toString();
      startHourGeo = start.hour.toString();
      startMinGeo = start.minute.toString();
      if (startYearShamsi == null ||
          startMonthShamsi == null ||
          startDayShamsi == null ||
          startHourShamsi == null ||
          startMinShamsi == null) {
        Map<String, String> shamsiDate = gregorianToShamsi({
          "year": startYearGeo,
          "month": startMonthGeo,
          "day": startDayGeo,
          "hour": startHourGeo,
          "min": startMinGeo,
        });
        startYearShamsi = shamsiDate["year"];
        startMonthShamsi = shamsiDate["month"];
        startDayShamsi = shamsiDate["day"];
        startHourShamsi = shamsiDate["hour"];
        startMinShamsi = shamsiDate["min"];
      }
    }
    //
    if (this.expirationDate != null) {
      DateTime expiration =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(this.expirationDate);
      endYearGeo = expiration.year.toString();
      endMonthGeo = expiration.month.toString();
      endDayGeo = expiration.day.toString();
      endHourGeo = expiration.hour.toString();
      endMinGeo = expiration.minute.toString();
      if (endYearShamsi == null ||
          endMonthShamsi == null ||
          endDayShamsi == null ||
          endHourShamsi == null ||
          endMinShamsi == null) {
        Map<String, String> shamsiDate = gregorianToShamsi({
          "year": endYearGeo,
          "month": endMonthGeo,
          "day": endDayGeo,
          "hour": endHourGeo,
          "min": endMinGeo,
        });
        endYearShamsi = shamsiDate["year"];
        endMonthShamsi = shamsiDate["month"];
        endDayShamsi = shamsiDate["day"];
        endHourShamsi = shamsiDate["hour"];
        endMinShamsi = shamsiDate["min"];
      }
    }
  }
}
