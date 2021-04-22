import 'package:shamsi_date/shamsi_date.dart';

String shamsiDayOfWeek(int year, int mouth, int day) {
  String shamsiDay;
  Jalali j = Jalali(year, mouth, day);

  int dayOfWeek = j.weekDay;
  switch (dayOfWeek) {
    case 0:
      {
        shamsiDay = 'جمعه';
      }
      break;
    case 1:
      {
        shamsiDay = 'شنبه';
      }
      break;
    case 2:
      {
        shamsiDay = 'یک شنبه';
      }
      break;
    case 3:
      {
        shamsiDay = 'دوشنبه';
      }
      break;
    case 4:
      {
        shamsiDay = 'سه شنبه';
      }
      break;
    case 5:
      {
        shamsiDay = 'چهار شنبه';
      }
      break;
    case 6:
      {
        shamsiDay = 'پنج شنبه';
      }
      break;
  }
  return shamsiDay;
}

String toPriceStyle(int price) {
  String sPrice = price.toString();
  int _counter = 0;
  String comma = ',';
  for (var i = sPrice.length - 1; i >= 0; i--) {
    _counter++;
    if (_counter == 3) {
      comma = i == 0 ? '' : ',';
      sPrice =
          sPrice.substring(0, i) + comma + sPrice.substring(i, sPrice.length);
      _counter = 0;
    }
  }
  return sPrice;
}

String toPhoneStyle(String phone) {
  int _counter = 0;
  String comma = '-';
  bool isInit = true;
  for (var i = phone.length - 1; i >= 0; i--) {
    _counter++;
    if (isInit ? _counter == 4 : _counter == 3) {
      isInit = false;
      comma = i == 0 ? '' : '-';
      phone = phone.substring(0, i) + comma + phone.substring(i, phone.length);
      _counter = 0;
    }
  }
  return phone;
}

Map<String, String> stringSplitDate(String date) {
  String year = date.substring(0, 4);
  String month = date.substring(5, 7);
  String day = date.substring(8, 10);
  Map<String, String> map = {
    'year': year,
    'month': month,
    'day': day,
  };
  return map;
}

String stringMergeDate(Map<String, String> date) {
  String year = date['year'];
  String mouth = date['month'];
  String day = date['day'];

  return '$year-$mouth-$day';
}

Map<String, String> gregorianToShamsi(Map<String, String> gregorianStr) {
  Gregorian gregorian = new Gregorian(
    int.parse(gregorianStr['year']),
    int.parse(gregorianStr['month']),
    int.parse(gregorianStr['day']),
  );

  Jalali jalali = gregorian.toJalali();
  Map<String, String> map = {
    'year': jalali.year.toString(),
    'month': jalali.month.toString(),
    'day': jalali.day.toString(),
  };
  return map;
}

Map<String, String> shamsiToGregorian(Map<String, String> shamsiStr) {
  Jalali jalali = Jalali(
    int.parse(shamsiStr['year']),
    int.parse(shamsiStr['month']),
    int.parse(shamsiStr['day']),
  );
  Gregorian gregorian = jalali.toGregorian();
  Map<String, String> map = {
    'year': gregorian.year.toString(),
    'month': gregorian.month.toString(),
    'day': gregorian.day.toString(),
  };
  return map;
}
