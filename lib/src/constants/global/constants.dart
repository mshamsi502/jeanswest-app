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
const String BASE_URL_FOR_MOCKOON = 'http://10.1.2.94:3001';
const String BASE_URL_FOR_JEANSWEST = 'http://10.0.1.111:5000';
const TextDirection rtlTextDirection = TextDirection.rtl;
const TextDirection ltrTextDirection = TextDirection.ltr;

// //
// List<Branch> localBranches = new List<Branch>();
//
bool isInit = true;
bool userIsAuth = false;
int tryToGetAllUserInfo = 4;
// GoogleMapWidget myGoogleMapWidget;
//
// GetIt mockoonGlobalLocator = GetIt.instance;
// GetIt jeanswestGlobalLocator = GetIt.instance;
// GetIt globalLocator = GetIt.instance;
GetIt globalLocator = GetIt.instance;
// GetIt jeanswestAuthLocator = GetIt.instance;
// GetIt jeanswestUnAuthLocator = GetIt.instance;
