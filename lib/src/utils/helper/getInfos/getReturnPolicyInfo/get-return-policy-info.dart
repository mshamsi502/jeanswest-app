//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/globalRes/ReturnPolicy/return-policy-res.dart';
import 'package:jeanswest/src/constants/global/globalInstances/return-policy-data.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

Future<void> getReturnPolicyInfo() async {
  ReturnPolicyRes returnPolicyRes =
      await globalLocator<GlobalRestClient>().getReturnPolicyInfo();
  if (returnPolicyRes.data != null &&
      returnPolicyRes.data[0] != null &&
      returnPolicyRes.data[0].header != null) {
    returnPolicyData = returnPolicyRes.data[0];
  } else if (HARDCORE_DATA_IS_ENABLE) {
    print("   / use HardCOre DATA ReturnPolicyInfo");
    returnPolicyData = returnPolicyTempData;
  }

  print('_=_ get successfully ReturnPolicyInfo: ${returnPolicyData.header}');
}
