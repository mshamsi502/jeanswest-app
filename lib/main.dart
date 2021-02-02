// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ! ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeanswest/src/app.dart';
import 'package:jeanswest/src/utils/service_locator/service_locator_global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setupLocator();
  setupLocator2();
  // setupLocatorWithoutAuth();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      EasyLocalization(
        /// => select default application language
        startLocale: Locale('fa', 'IR'),
        // startLocale: Locale('en', 'US'),
        //
        supportedLocales: [
          Locale('en', 'US'),
          Locale('fa', 'IR'),
          Locale('ar', 'AE')
        ],
        path: 'assets/translations', // <-- change patch to your
        fallbackLocale: Locale('fa', 'IR'),
        saveLocale: true,
        child: MyApp(),
      ),
    );
  });
}
