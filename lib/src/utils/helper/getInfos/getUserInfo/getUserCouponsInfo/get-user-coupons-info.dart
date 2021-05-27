//

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-jeanpoints-info.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/userRes/userJeanpointAndBons/user-jeanpoints-data.dart';
import 'package:jeanswest/src/models/api_response/userRes/userJeanpointAndBons/user-jeanpoints-res.dart';
import 'package:jeanswest/src/models/profile/user/user-copouns-info.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

Future<void> userCouponsInfo() async {
  UserJeanpointsRes userJeanpointBonsRes;
  try {
    userJeanpointBonsRes = await globalLocator<GlobalRestClient>()
        .getUserJeanpointBonsInfo(); // ! from real API
    print(
        '_=_ get successfully copouns length: ${userJeanpointBonsRes.data.length}');

    addCopouns(userJeanpointBonsRes.data);
  } catch (errorRealAPI) {
    print('Catch Error from userCouponsInfo ** Real API ** !');
    printErrorMessage(errorRealAPI);
    print('*********************************');
    if (MOCK_IS_ENABLE) {
      try {
        userJeanpointBonsRes = await globalLocator<GlobalRestClient>()
            .getMockUserJeanpointBonsInfo(); // ! from mockoon
        addCopouns(userJeanpointBonsRes.data);
      } catch (errorMockoon) {
        print('*********************************');
        print('Catch Error from userMockCouponsInfo ** Mockoon ** !');
        printErrorMessage(errorMockoon);
        print('*********************************');
      }
    }
  }
  print(
      '_=_ get successfully userJeanpointBons length: ${userJeanpointBons.length}');
  print('_=_  first userJeanpointBons code: ${userJeanpointBons[0].code}');
}

addCopouns(List<UserJeanpointsData> copouns) {
  // ignore: deprecated_member_use
  userJeanpointBons = new List<UserCouponsInfo>();
  copouns.forEach((element) {
    userJeanpointBons.add(UserCouponsInfo(
      code: element.code,
      startDate: element.startDate,
      expirationDate: element.expirationDate,
      price: element.price,
      promotionPoint: element.promotionPoint,
    ));
  });
}
