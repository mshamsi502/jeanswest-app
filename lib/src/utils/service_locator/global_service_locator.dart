// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:dio/dio.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setupGlobalLocator() async {
  globalLocator.registerSingletonAsync<SharedPreferences>(() async {
    final localStorageService = SharedPreferences.getInstance();
    return localStorageService;
  });

  globalLocator.registerFactoryParam<GlobalRestClient, String, void>(
      // globalLocator.registerFactoryParam<UnAuthRestClient, String, void>(
      (String baseUrl, _) {
    Dio dio = new Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      if (globalLocator<SharedPreferences>().getString(TOKEN) != null) {
        options.headers["Authorization"] =
            "Bearer " + globalLocator<SharedPreferences>().getString(TOKEN);
      }
      // Do something before request is sent
      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (Response response) async {
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) async {
      // Do something with response error
      return e; //continue
    }));
    final client = GlobalRestClient(dio, baseUrl: baseUrl);
    // final client = UnAuthRestClient(dio, baseUrl: baseUrl);
    return client;
  });
}

// globalLocator.registerLazySingleton(() => MockoonUnauth());
// globalLocator.registerLazySingleton(() => MockoonAuth());
// globalLocator.registerLazySingleton(() => JeanswestUnauth());
// globalLocator.registerFactoryParam<JeanswestUnauth, String, void>(
//     (String baseUrl, _) => JeanswestUnauth().jeanswestUnauth(baseUrl));
// globalLocator.registerLazySingleton(() => JeanswestAuth());
// }
