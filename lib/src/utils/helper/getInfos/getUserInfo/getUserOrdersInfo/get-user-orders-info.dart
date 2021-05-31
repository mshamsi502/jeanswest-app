//

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-order-info.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
// import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/data-order-result-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/user-order-data-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

Future<void> userOrdersInfo() async {
  UserOrderDataRes uo;
  // userOrders = await globalLocator<GlobalRestClient>().getUserOrdersInfo();
  //
  try {
    uo = await globalLocator<GlobalRestClient>().getUserOrdersInfo();
    if (uo.statusCode == 200) {
      userOrdersa = uo.data;
    } else {
      print(uo.message);
    }
  } catch (e) {
    printErrorMessage(e);
  }
  if (uo != null && uo.data != null && uo.data.offlineOrders != null) {
    print(
        '_=_ get successfully, offlineOrders length: ${userOrdersa.offlineOrders.length}');
    print(
        '_=_ get successfully, inProgressOrders length: ${userOrdersa.inProgressOrders.length}');
    print(
        '_=_ get successfully, compeletedOrders length: ${userOrdersa.compeletedOrders.length}');
    print(
        '_=_ get successfully, returnedOrders length: ${userOrdersa.returnedOrders.length}');
    print('_=_ first offlineOrders code: ${userOrdersa.offlineOrders[0].code}');
  }
}
