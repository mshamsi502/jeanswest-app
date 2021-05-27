//

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-tickets-info.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/user-tickets-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';

Future<void> userTicketsInfo() async {
  UserTicketsRes userTicketsRes =
      await globalLocator<GlobalRestClient>().getUserTicketsInfo();
  userTickets = userTicketsRes.data;
  print('_=_ get successfully, userTickets length: ${userTickets.length}');
  print('_=_ get successfully, first userTickets code: ${userTickets[0].code}');
}
