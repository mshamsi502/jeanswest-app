//

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-payment-info.dart';
import 'package:jeanswest/src/models/api_response/userRes/userPayment/user-payment-info-res.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/profile/user/user-payment-info.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';

Future<void> userPaymentInfo() async {
  UserPaymentInfoRes userPaymentInfoRes =
      await globalLocator<GlobalRestClient>().getUserPaymentInfo();
  userPayment =
      new UserPaymentInfo(moneyBuying: userPaymentInfoRes.moneyBuying);
  print(
      '_=_ get successfully UserPaymentInfo: ${userPaymentInfoRes.moneyBuying}');
  // ! ==> get and create successfully UserPaymentInfo
}
