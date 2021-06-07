//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/globalRes/aboutUs/about-us-res.dart';
import 'package:jeanswest/src/constants/global/globalInstances/about-us-data.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

Future<void> getAboutUsInfo() async {
  AboutUsRes aboutUsRes =
      await globalLocator<GlobalRestClient>().getAboutUsInfo();
  aboutUsData = aboutUsRes.data[0];

  if (aboutUsRes.data != null &&
      aboutUsRes.data[0] != null &&
      aboutUsRes.data[0].banner != null) {
    aboutUsData = aboutUsRes.data[0];
  } else if (HARDCORE_DATA_IS_ENABLE) {
    print("   / use HardCOre DATA contactUsInfo");
    aboutUsData = aboutUsTempData;
  }
  print('_=_ get successfully contactUsInfo phone: ${aboutUsData.banner.text}');
}
