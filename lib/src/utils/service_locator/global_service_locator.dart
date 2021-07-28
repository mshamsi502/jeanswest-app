// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:dio/dio.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

const String bbaseUrl = String.fromEnvironment('base_url');
createDio() {
  globalLocator.registerFactoryParam<GlobalRestClient, String, void>(
      // globalLocator.registerFactoryParam<UnAuthRestClient, String, void>(
      // (String bbaseUrl, _) {
      (String baseUrl, _) {
    Dio dio = new Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      if (sharedPrefs.getString(TOKEN) != null) {
        options.headers["Authorization"] =
            "Bearer " + sharedPrefs.getString(TOKEN);
      }
      // options.baseUrl = String.fromEnvironment('base_url');
      return options; //continue
    }, onResponse: (Response response) async {
      return response; // continue
    }, onError: (DioError e) async {
      return e; //continue
    }));

    final client =
        // GlobalRestClient(dio, baseUrl: String.fromEnvironment('base_url'));
        GlobalRestClient(dio, baseUrl: baseUrl);
    // GlobalRestClient(dio, baseUrl: bbaseUrl);
    return client;
  });
}
