//

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/user-addresses-info-res.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';

Future<void> userAddressesInfo() async {
  // userAddresses

  UserAddressesInfoRes addRes =
      await globalLocator<GlobalRestClient>().getUserAddressesInfo();
  if (addRes.statusCode == 200) {
    userAddresses = addRes.data;
  } else {
    print(addRes.message);
  }

  print('***************************************************************');
  print('_=_ get successfully, userAddresses length: ${userAddresses.length}');
  print(
      '_=_ get successfully, userAddresses first: ${userAddresses[0].address}');
}
