//

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-jeanpoints-info.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/userRes/userJeanpointAndBons/user-jeanpoints-response.dart';
import 'package:jeanswest/src/models/coupon/coupon.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

Future<void> userCouponsInfo() async {
  UserJeanpointsResponse userJeanpointBonsRes =
      await globalLocator<GlobalRestClient>().getUserJeanpointBonsInfo();
  // ignore: deprecated_member_use
  userJeanpointBons = new List<Coupon>();
  userJeanpointBonsRes.data.forEach((element) {
    userJeanpointBons.add(
      Coupon(
        code: element.code,
        engName: element.engName,
        perName: element.perName,
        description: element.description,
        price: element.price,
        minShopping: element.minShopping,
        startDate: element.startDate,
        endDate: element.endDate,
      ),
    );
  });
  print(
      '_=_ get successfully userJeanpointBons length: ${userJeanpointBons.length}');
  print('_=_  first userJeanpointBons code: ${userJeanpointBons[0].code}');
}
