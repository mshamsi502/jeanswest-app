//

import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/userRes/userPayment/user-payment-info-res.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/profile/user/user-payment-info.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

Future<UserPaymentInfo> userPaymentInfo() async {
  UserPaymentInfoRes userPaymentInfoRes = UserPaymentInfoRes();

  try {
    userPaymentInfoRes = await globalLocator<GlobalRestClient>()
        .getUserPaymentInfo(); // ! from real API

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
  if (MOCK_IS_ENABLE && userPaymentInfoRes.statusCode != 200) {
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

  return UserPaymentInfo(
    tblPosCustomersID: userPaymentInfoRes.data[0].tblPosCustomersID,
    payRial: userPaymentInfoRes.data[0].moneyBuying,
    cusType: userPaymentInfoRes.data[0].cusType,
    cTypeName: userPaymentInfoRes.data[0].cTypeName,
    priceLevel: userPaymentInfoRes.data[0].priceLevel,
    priceLevelTo: userPaymentInfoRes.data[0].priceLevelTo,
  );
}
