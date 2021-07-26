// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

List<dynamic> checkCorrectPhone(
    {@required String inputPhone, @required bool startWithZero}) {
  if (inputPhone == null || inputPhone == '') {
    return [false, "login_screen.phone_number_is_incorrect".tr()];
  } else {
    if (startWithZero) {
      //
      if (!(inputPhone.startsWith('0')))
        return [false, "login_screen.enter_phone_number_with_first_zero".tr()];
      else if (inputPhone.length != 11)
        return [false, "login_screen.phone_number_must_be_eleven_number".tr()];
      else
        return [true, ''];
      //
    } else {
      //
      if (!(inputPhone.startsWith('9')))
        return [
          false,
          "login_screen.phone_number_must_be_start_with_nine".tr()
        ];
      else if (inputPhone.length != 10)
        return [false, "login_screen.phone_number_must_be_ten_number".tr()];
      else
        return [true, ''];
      //
    }
  }
}

List<dynamic> checkCorrectCode({String inputVerifyCode}) {
  String newValue = inputVerifyCode.replaceAll(' ', '');
  if (!isNaturalNumeric(newValue))
    return [false, 'پر کردن همه فیلدها الزامیست'];
  else if (newValue.length < 5)
    return [false, 'تنها اعداد (بین 0 تا 9) میتوانید وارد کنید'];
  else
    return [true, ''];
}

bool isNaturalNumeric(String s) {
  if (s == null) {
    return false;
  }
  return
      // ignore: deprecated_member_use
      int.parse(s, onError: (e) => null) != null && int.parse(s) >= 0;
}

String getTypeFileLink(String link) {
  String type = "";
  if (link.contains(".")) {
    String reversedLink = link.split('').reversed.join();

    List<String> listreversedLink = reversedLink.split(".");
    // print(listreversedLink);
    type = listreversedLink[0].split('').reversed.join().toLowerCase();
    // print(type);
  }
  return type;
}
