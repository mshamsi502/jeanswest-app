//

import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/globalRes/contactUs/contact-us-res.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';

Future<void> getContactUsInfo() async {
  ContactUsRes contactUsRes =
      await globalLocator<GlobalRestClient>().getContactUsInfo();
  contactUsInfo = contactUsRes.data;

  print('_=_ get successfully contactUsInfo phone: ${contactUsInfo.phone}');
}
