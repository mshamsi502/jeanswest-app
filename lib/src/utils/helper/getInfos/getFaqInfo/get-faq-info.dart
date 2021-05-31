//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/globalRes/faq/faq-res.dart';
import 'package:jeanswest/src/constants/global/globalInstances/faq-data.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

Future<void> getFaqInfo() async {
  FAQRes faqRes = await globalLocator<GlobalRestClient>().getFAQInfo();
  if (faqRes.data != null &&
      faqRes.data[0] != null &&
      faqRes.data[0].answer != null) {
    faqData = faqRes.data;
  } else if (HARDCORE_DATA_IS_ENABLE) {
    print("   / use HardCOre DATA contactUsInfo");
    faqData = faqTempData;
  }

  print('_=_ get successfully faqData: ${faqData[0].question}');
}
