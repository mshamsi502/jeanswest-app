//

import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/globalRes/faq/faq-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

Future<void> getFaqInfo() async {
  FAQRes faqRes = await globalLocator<GlobalRestClient>().getFAQInfo();
  faqData = faqRes.data;

  print('_=_ get successfully faqData: ${faqData.length}');
  print('_=_ get successfully faqData: ${faqData[0].question}');
}
