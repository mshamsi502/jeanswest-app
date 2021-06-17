//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/globalRes/contactUs/contact-us-res.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/contact-us-data.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

Future<void> getContactUsInfo() async {
  ContactUsRes contactUsRes =
      await globalLocator<GlobalRestClient>().getContactUsInfo();

  if (contactUsRes.data != null &&
      contactUsRes.data[0] != null &&
      contactUsRes.data[0].phone != null) {
    contactUsInfo = contactUsRes.data[0];
  } else if (HARDCORE_DATA_IS_ENABLE) {
    print("   / use HardCOre DATA contactUsInfo");
    contactUsInfo = contactUsTempInfo;
  }
  print('_=_ get successfully contactUsInfo phone: ${contactUsInfo.phone}');
}
