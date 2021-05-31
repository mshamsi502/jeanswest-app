//

import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/dataTickets/data-ticket.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/create-ticket-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/user-tickets-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

Future<List<DataTicket>> getUserTicketsInfo() async {
  UserTicketsRes userTicketsRes;
  try {
    userTicketsRes =
        await globalLocator<GlobalRestClient>().getUserTicketsInfo();
  } catch (errorRealAPI) {
    print('Catch Error from ** Real API ** , getUserTicketsInfo!');
    printErrorMessage(errorRealAPI);
    print('*********************************');
    if (MOCK_IS_ENABLE) {
      try {
        userTicketsRes =
            await globalLocator<GlobalRestClient>().getMockUserTicketsInfo();
        // ! from mockoon

      } catch (errorMockoon) {
        print('*********************************');
        print('Catch Error from ** Mockoon **,  getMockUserTicketsInfo !');
        printErrorMessage(errorMockoon);
        print('*********************************');
      }
    }
  }
  // userTickets = userTicketsRes.data;
  // if (userTickets != null) {
  print(
      '_=_ get successfully, userTickets length: ${userTicketsRes.data.length}');
  print(
      '_=_ get successfully, first userTickets code: ${userTicketsRes.data[0].code}');
  return userTicketsRes.data;
  // }
}

Future<DataTicket> createNewTicket(Map<String, dynamic> newTicket) async {
  CreateTicketRes userTicketsRes;
  try {
    userTicketsRes = await globalLocator<GlobalRestClient>()
        .createUserTicketsInfo(newTicket);
    print(
        '_=_ get successfully, new userTickets title: ${userTicketsRes.data.title}');
  } catch (errorRealAPI) {
    print('Catch Error from ** Real API ** createUserTicketsInfo !');
    printErrorMessage(errorRealAPI);
    print('*********************************');
  }
  return userTicketsRes.data;
}

Future<DataTicket> replyTicket(Map<String, dynamic> newMessage) async {
  CreateTicketRes userTicketsRes;
  try {
    userTicketsRes =
        await globalLocator<GlobalRestClient>().replyTicketsInfo(newMessage);
    print(
        '_=_ get successfully,  replyTicketsInfo title: ${userTicketsRes.data.code}');
  } catch (errorRealAPI) {
    print('Catch Error from ** Real API ** replyTicketsInfo !');
    printErrorMessage(errorRealAPI);
    print('*********************************');
  }
  return userTicketsRes.data;
}
