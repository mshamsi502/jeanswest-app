// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-08  ,  13:11 PM
// ****************************************************************************

import 'package:intl/intl.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:shamsi_date/shamsi_date.dart';

class TimeAgo {
  static String timeAgoSinceDate(String dateString, int sinceFromSomeDay,
      {bool numericDates = true, String dateFormat = SMALL_JUST_DATE_FORMAT}) {
    DateTime notificationDate = DateFormat(dateFormat).parse(dateString);
    final date2 = DateTime.now();
    final difference = date2.difference(notificationDate);
    if (difference.inDays > sinceFromSomeDay) {
      Gregorian gregorianDate = Gregorian(
          int.parse(dateString.substring(0, 4)),
          int.parse(dateString.substring(5, 7)),
          int.parse(dateString.substring(8, 10)));
      return '${gregorianDate.toJalali().year.toString()}/${gregorianDate.toJalali().month.toString()}/${gregorianDate.toJalali().day.toString()}';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return (numericDates) ? '1 ماه قبل' : 'ماه گذشته';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 هفته قبل' : 'هفته گذشته';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} روز قبل';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 روز قبل' : 'دیروز';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} ساعت قبل';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 ساعت قبل' : 'یک ساعت قبل';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} دقیقه قبل';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 دقیقه قبل' : 'یک دقیقه قبل';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} ثانیه قبل';
    } else {
      return 'همین الان';
    }
  }
}
