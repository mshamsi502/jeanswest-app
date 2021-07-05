// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:dio/dio.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

createDio() {
  globalLocator.registerFactoryParam<GlobalRestClient, String, void>(
      // globalLocator.registerFactoryParam<UnAuthRestClient, String, void>(
      (String baseUrl, _) {
    Dio dio = new Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      if (sharedPrefs.getString(TOKEN) != null) {
        options.headers["Authorization"] =
            "Bearer " + sharedPrefs.getString(TOKEN);
      }
      return options; //continue
    }, onResponse: (Response response) async {
      return response; // continue
    }, onError: (DioError e) async {
      return e; //continue
    }));

    final client = GlobalRestClient(dio, baseUrl: baseUrl);
    // final client = UnAuthRestClient(dio, baseUrl: baseUrl);
    return client;
  });
}
