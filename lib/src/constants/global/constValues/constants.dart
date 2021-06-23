// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************
//
//
import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN = 'token';
//
const String BASE_URL_FOR_BRANCH_ADDRESS = 'https://jeanswest.club';
const String EMPTY_IMAGE =
    'https://www.jeanswest.ir/b2b/assets/img/brand/avakatan.png';
//
const TextDirection rtlTextDirection = TextDirection.rtl;
const TextDirection ltrTextDirection = TextDirection.ltr;

bool showCompeletProfileMessage = false;

const List<String> shamsiMonthName = [
  'فروردین',
  'اردیبهشت',
  'خرداد',
  'تیر',
  'مرداد',
  'شهریور',
  'مهر',
  'آبان',
  'آذر',
  'دی',
  'بهمن',
  'اسفند',
];
const String HINT_PHONE_NUMBER_INPUT = '0912 - - - - - - -';
List<String> optionGroup = [
  "جنسیت",
  "رده سنی",
  "گروه رنگی",
  "سایز",
  "محدوده قیمت",
];
double minPriceCategoty = 0;
double maxPriceCategoty = 30000000;
double unitPriceCategoty = 200000;
// //
// List<Branch> localBranches = new List<Branch>();
//
// bool isInit = true;
bool userIsAuth = false;

String completeProfileMsgDateTime = '';

// ! -----------------------------------

GetIt globalLocator = GetIt.instance;

SharedPreferences sharedPrefs;
