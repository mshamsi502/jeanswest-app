//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/globalRes/ReturnPolicy/return-policy-res.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/return-policy-data.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

Future<void> getReturnPolicyInfo() async {
  try {
    ReturnPolicyRes returnPolicyRes =
        await globalLocator<GlobalRestClient>().getReturnPolicyInfo();
    if (returnPolicyRes.data != null &&
        returnPolicyRes.data[0] != null &&
        returnPolicyRes.data[0].condition != null) {
      returnPolicyData = returnPolicyRes.data;
    } else if (HARDCORE_DATA_IS_ENABLE) {
      print("   / use HardCOre DATA ReturnPolicyInfo");
      returnPolicyData = returnPolicyTempData;
    }
  } catch (e) {
    // printErrorMessage(e);
    if (HARDCORE_DATA_IS_ENABLE) {
      print("   / use HardCOre DATA ReturnPolicyInfo");
      returnPolicyData = returnPolicyTempData;
    }
  }

  if (returnPolicyData != null && returnPolicyData.length > 0) {
    print(
        '_=_ get successfully ReturnPolicyInfo length: ${returnPolicyData.length}');
    print(
        '_=_ get successfully ReturnPolicyInfo: ${returnPolicyData.first.condition}');
  }
}
