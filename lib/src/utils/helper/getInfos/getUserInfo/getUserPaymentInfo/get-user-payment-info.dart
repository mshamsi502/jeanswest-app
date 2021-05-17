//

import 'package:jeanswest/src/models/api_response/userRes/userPayment/user-payment-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userPayment/user-payment-info-data.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

Future<UserPaymentInfoData> userPaymentInfo(String id) async {
  UserPaymentInfoRes userPaymentInfoRes = UserPaymentInfoRes();
  Map<String, String> mapId = {"id": id};

  try {
    userPaymentInfoRes = await globalLocator<GlobalRestClient>()
        .getUserPaymentInfo(mapId); // ! from real API

  } catch (errorRealAPI) {
    print('Catch Error from ** Real API ** !');
    printErrorMessage(errorRealAPI);
    print('*********************************');
    if (MOCK_IS_ENABLE) {
      try {
        userPaymentInfoRes = await globalLocator<GlobalRestClient>()
            .getMockUserPaymentInfo(); // ! from mockoon

      } catch (errorMockoon) {
        print('*********************************');
        print('Catch Error from ** Mockoon ** !');
        printErrorMessage(errorMockoon);
        print('*********************************');
      }
    }
  }

  return userPaymentInfoRes.data[0];
}
