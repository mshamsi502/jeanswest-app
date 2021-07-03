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
//
const String STYLE_CODE_SORT = "styleCode";
const String SALE_PRICE_SORT = "salePrice";
const String DISCOUNT_SORT = "discount";
const String COLOR_SORT = "color";
const String SEARCH_SORT = "search";
//
const String COLOR_UNIQUE = "color";
const String STYLE_UNIQUE = "style";
//
List<String> optionGroup = [
  "جنسیت",
  "رده سنی",
  "گروه رنگی",
  "سایز",
  "محدوده قیمت",
];
//
List<String> sortOptionsName = [
  "پیش فرض",
  "ارزان ترین",
  "گران ترین",
  "بیشترین تخفیف",
  "تنوع بر اساس رنگ",
];
//
const double minPriceCategoty = 0;
const double maxPriceCategoty = 30000000;
const double unitPriceCategoty = 200000;
//
const int getProductLimit = 8;
//
// List<Branch> localBranches = new List<Branch>();
//
// bool isInit = true;
bool userIsAuth = false;

String completeProfileMsgDateTime = '';

// ! -----------------------------------

GetIt globalLocator = GetIt.instance;

SharedPreferences sharedPrefs;
