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
      if (inputPhone.length != 11)
        return [false, "login_screen.phone_number_must_be_eleven_number".tr()];
      else if (!(inputPhone.startsWith('0')))
        return [false, "login_screen.enter_phone_number_with_first_zero".tr()];
      else
        return [true, ''];
      //
    } else {
      //
      if (inputPhone.length != 10)
        return [false, "login_screen.phone_number_must_be_ten_number".tr()];
      if (!(inputPhone.startsWith('9')))
        return [
          false,
          "login_screen.phone_number_must_be_start_with_nine".tr()
        ];
      else
        return [true, ''];
      //
    }
  }

  //
  // return inputPhone == null || inputPhone == ''
  //     ? [false, "login_screen.phone_number_is_incorrect".tr()]
  //     : startWithZero && inputPhone.length != 11
  //         ? [false, "login_screen.phone_number_must_be_ten_number".tr()]
  //         : startWithZero && inputPhone.length != 10
  //             ? [false, "login_screen.phone_number_must_be_ten_number".tr()]
  //             : !inputPhone.startsWith('9')
  //                 ? [
  //                     false,
  //                     "login_screen.phone_number_must_be_start_with_nine".tr()
  //                   ]
  //                 : startWithZero && inputPhone.startsWith('0')
  //                     ? [true, '']
  //                     : !startWithZero && inputPhone.startsWith('0')
  //                         ? [
  //                             false,
  //                             "login_screen.enter_phone_number_without_first_zero"
  //                                 .tr()
  //                           ]
  //                         : [true, ''];
}

List<dynamic> checkCorrectCode({String inputVerifyCode}) {
  return inputVerifyCode == null ||
          inputVerifyCode.length != 5 ||
          inputVerifyCode.contains('-')
      ? [false, "login_screen.enter_the_code_more_carefully".tr()]
      // : inputCode != '23456'
      //     ? [false, "login_screen.code_is_incorrect".tr()]
      : [true, ''];
}
