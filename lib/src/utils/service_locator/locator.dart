// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/services/dynamic_link_services.dart';
import 'package:jeanswest/src/utils/service_locator/global_service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setupGlobalLocator() async {
  globalLocator.registerSingletonAsync<SharedPreferences>(() async {
    final localStorageService = SharedPreferences.getInstance();
    return localStorageService;
  });

  globalLocator.registerLazySingleton(() => DynamicLinkService());

  //
  //
  createDio();
}
