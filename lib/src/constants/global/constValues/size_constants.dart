// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ! ****************************************************************************

import 'package:flutter/material.dart';

// const int RECEIVE_TIMEOUT = 10000;
// const int CONNECT_TIMEOUT = 10000;
const int RECEIVE_TIMEOUT = 5000;
const int CONNECT_TIMEOUT = 5000;
//
// const String LOGIN_LIMIT_MIN_TIMEOUT = '01';
// const String LOGIN_LIMIT_SEC_WITH_MIN_TIMEOUT = '59';
const String LOGIN_LIMIT_SEC_TIMEOUT = '130';
// const String LOGIN_LIMIT_SEC_TIMEOUT = '20';
//
const Duration POPUP_INFO_BRANCH_DURATION_ANIMATION =
    Duration(milliseconds: 300);
const Duration POPUP_LIST_VIEW_BRANCH_DURATION_ANIMATION =
    Duration(milliseconds: 700);
// ignore: non_constant_identifier_names
double CREATE_BOTTOM_NAVIGATION_BAR_HEIGHT(Size _screenSize) {
  return (0.097972 * _screenSize.height //58
      );
}
