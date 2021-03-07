// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/utils/helper/global/helper.dart';

Future<bool> callAPIsProvider({Function() callApi}) async {
  if (await checkConnectionInternet()) {
    try {
      // ! call API
      callApi();
      return true;
    } catch (error) {
      printErrorMessage(error);
      return false;
    }
  } else {
    print('OoOoOoOoO -- load from SQFLite');
    // ! show ErrorMessag toast
    return false;
  }
}
