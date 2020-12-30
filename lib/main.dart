import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/app.dart';
import 'package:jeanswest/src/utils/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
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
}
