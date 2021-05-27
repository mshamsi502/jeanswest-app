//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/api_response/globalRes/faq/faq-data.dart';
import 'package:jeanswest/src/models/api_response/globalRes/faq/faq-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

Future<List<FAQData>> getInviteFriendFAQInfo() async {
  FAQRes inviteFriendsfaqRes =
      await globalLocator<GlobalRestClient>().getInviteFriendFAQ();
  print(
      '_=_ get successfully inviteFriendsfaqRes length: ${inviteFriendsfaqRes.data.length}');
  print(
      '_=_ get successfully first que inviteFriendsfaqRes: ${inviteFriendsfaqRes.data[0].question}');
  return inviteFriendsfaqRes.data;
}
