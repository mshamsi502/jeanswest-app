// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************
//
//
import 'dart:ui';

import 'package:get_it/get_it.dart';

const String TOKEN = 'token';
const String BASE_URL_FOR_BRANCH_ADDRESS = 'https://jeanswest.club';
// const String BASE_URL_FOR_LOGIN = 'https://localhost:3001';
// const String BASE_URL_FOR_LOGIN = 'localhost:3001';
const String BASE_URL_FOR_MOCKOON = 'http://10.0.2.2:3001';
const TextDirection rtlTextDirection = TextDirection.rtl;
const TextDirection ltrTextDirection = TextDirection.ltr;

// //
// List<Branch> localBranches = new List<Branch>();
//
bool isInit = true;
// GoogleMapWidget myGoogleMapWidget;
//
GetIt globalLocator = GetIt.instance;
