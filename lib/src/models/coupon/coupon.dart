// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

// ignore: must_be_immutable

class Coupon {
  final String title;
  final List<String> conditions;
  final String price;
  final String startDay;
  final String startMonth;
  final String startYear;
  final String endDay;
  final String endMonth;
  final String endYear;

  Coupon({
    this.title,
    this.conditions,
    this.price,
    this.startDay,
    this.startMonth,
    this.startYear,
    this.endDay,
    this.endMonth,
    this.endYear,
  });
}
