import 'package:easy_localization/easy_localization.dart';
import 'package:jeanswest/src/constants/global/option.dart';
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

Map<String, String> stringSplitDate(String date,
    {String dateFormat = SMALL_JUST_DATE_FORMAT}) {
  Map<String, String> map = {
    'year': '2000',
    'month': '01',
    'day': '01',
    'hour': '00',
    'min': '00',
    'sec': '00',
  };
  if (date != null || date != "") {
    DateTime dateTime = DateFormat(dateFormat).parse(date);
    if (dateFormat == SMALL_JUST_DATE_FORMAT) {
      String year = dateTime.year.toString();
      String month = dateTime.month.toString();
      String day = dateTime.day.toString();
      map = {
        'year': year,
        'month': month,
        'day': day,
      };
    } else if (dateFormat == SMALL_DATE_AND_TIME_FORMAT) {
      String year = dateTime.year.toString();
      String month = dateTime.month.toString();
      String day = dateTime.day.toString();
      String hour = dateTime.hour.toString();
      String min = dateTime.minute.toString();
      map = {
        'year': year,
        'month': month,
        'day': day,
        'hour': hour,
        'min': min,
      };
    } else if (dateFormat == STANDARD_DATE_FORMAT) {
      String year = dateTime.year.toString();
      String month = dateTime.month.toString();
      String day = dateTime.day.toString();
      String hour = dateTime.hour.toString();
      String min = dateTime.minute.toString();
      String sec = dateTime.second.toString();
      map = {
        'year': year,
        'month': month,
        'day': day,
        'hour': hour,
        'min': min,
        'sec': sec,
      };
    }
  }
  // ! date type is : yyyy-mm-dd

  // if (date != null || date != "") {
  //   if (date.length == 10) {
  //     // ! date : "2022-06-12"
  //     String year = date.substring(0, 4);
  //     String month = date.substring(5, 7);
  //     String day = date.substring(8, 10);
  //     map = {
  //       'year': year,
  //       'month': month,
  //       'day': day,
  //     };
  //   } else if (date.length == 19) {
  //     String year = date.substring(0, 4);
  //     String month = date.substring(5, 7);
  //     String day = date.substring(8, 10);
  //     String hour = date.substring(11, 13);
  //     String min = date.substring(14, 16);
  //     String sec = date.substring(17, 19);
  //     map = {
  //       'year': year,
  //       'month': month,
  //       'day': day,
  //       'hour': hour,
  //       'min': min,
  //       'sec': sec,
  //     };
  //   }
  // }
  return map;
}

String stringMergeDate(Map<String, String> date) {
  String year = "00";
  String mouth = "00";
  String day = "00";
  if (date != null) {
    year = date['year'];
    mouth = date['month'];
    day = date['day'];
  }
  return '$year-$mouth-$day';
}

Map<String, String> gregorianToShamsi(Map<String, String> gregorianStr) {
  Map<String, String> map = {
    'year': '0000',
    'month': '00',
    'day': '00',
    'hour': '00',
    'min': '00',
  };
  if (gregorianStr != null) {
    Gregorian gregorian = new Gregorian(
      int.parse(gregorianStr['year']),
      int.parse(gregorianStr['month']),
      int.parse(gregorianStr['day']),
    );

    Jalali jalali = gregorian.toJalali();
    map = {
      'year': jalali.year.toString(),
      'month': convertToDoubleDigit(jalali.month.toString()),
      'day': convertToDoubleDigit(jalali.day.toString()),
      'hour': gregorianStr['hour'] ?? "00",
      'min': gregorianStr['hour'] ?? "00",
    };
  }
  return map;
}

Map<String, String> shamsiToGregorian(Map<String, String> shamsiStr) {
  Map<String, String> map = {
    'year': '0000',
    'month': '00',
    'day': '00',
    'hour': '00',
    'min': '00',
  };
  if (shamsiStr != null) {
    Jalali jalali = Jalali(
      int.parse(shamsiStr['year']),
      int.parse(shamsiStr['month']),
      int.parse(shamsiStr['day']),
    );
    Gregorian gregorian = jalali.toGregorian();
    map = {
      'year': gregorian.year.toString(),
      'month': convertToDoubleDigit(gregorian.month.toString()),
      'day': convertToDoubleDigit(gregorian.day.toString()),
      'hour': shamsiStr['hour'] ?? "00",
      'min': shamsiStr['hour'] ?? "00",
    };
  }
  return map;
}

String convertToDoubleDigit(String oldString) {
  if (oldString.length == 1)
    return "0$oldString";
  else if (oldString.length == 2)
    return oldString;
  else
    return "00";
}

String convertToTripleDigit(String oldString) {
  if (oldString.length == 1)
    return "00$oldString";
  else if (oldString.length == 2)
    return "0$oldString";
  else if (oldString.length == 3)
    return oldString;
  else
    return "000";
}

String toStandardPhoneNumberforAPIs(String phone) {
  String rawPhone;
  if (phone.length == 10 && !phone.startsWith("0") && !phone.startsWith("+"))
    rawPhone = phone;
  else if (phone.length == 11 &&
      phone.startsWith("0") &&
      !phone.startsWith("+"))
    rawPhone = phone.substring(1);
  else if (phone.length == 13 &&
      !phone.startsWith("0") &&
      phone.startsWith("+")) rawPhone = phone.substring(3);
  if (STANDARD_PHONE_NUMBER_STYLE_FOR_API == "xxx-xxx-xxxx") {
    return rawPhone;
  } else if (STANDARD_PHONE_NUMBER_STYLE_FOR_API == "0xxx-xxx-xxxx") {
    return "0$rawPhone";
  } else if (STANDARD_PHONE_NUMBER_STYLE_FOR_API == "+98xxx-xxx-xxxx") {
    return "+98$rawPhone";
  } else
    return phone;
}

List<String> splitStringFromDash(String oldString, {bool withSpace = false}) {
  List<String> _splitedColor = [];
  if (oldString.contains(withSpace ? " - " : "-")) {
    _splitedColor = oldString.split(withSpace ? " - " : "-");
    for (int clearIndex = 0; clearIndex < _splitedColor.length; clearIndex++) {
      if (_splitedColor[clearIndex].startsWith(' ') ||
          _splitedColor[clearIndex].endsWith(' ')) {
        while (_splitedColor[clearIndex].startsWith(' ')) {
          _splitedColor[clearIndex] = _splitedColor[clearIndex].substring(1);
        }
        while (_splitedColor[clearIndex].endsWith(' ')) {
          _splitedColor[clearIndex] = _splitedColor[clearIndex]
              .substring(0, _splitedColor[clearIndex].length - 1);
        }
      }
    }
  } else {
    _splitedColor.add(oldString);
  }
  return _splitedColor;
}
