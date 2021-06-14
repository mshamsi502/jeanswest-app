// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ! ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jeanswest/src/app.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:jeanswest/src/utils/service_locator/locator.dart';
// import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  // await FlutterConfig.loadEnvVariables();
  await dotenv.load(fileName: ".env");
  //
  setupGlobalLocator();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then((_) {
    runApp(
      Phoenix(
        child: EasyLocalization(
          // !  select default application language
          startLocale: Locale('fa', 'IR'),
          // startLocale: Locale('en', 'US'),
          //
          supportedLocales: [
            Locale('en', 'US'),
            Locale('fa', 'IR'),
            Locale('ar', 'AE')
          ],
          path: 'assets/translations', // ! <-- patch of translations files
          fallbackLocale: Locale('fa', 'IR'),
          saveLocale: true,
          child: MyApp(),
        ),
      ),
    );
  });
}
