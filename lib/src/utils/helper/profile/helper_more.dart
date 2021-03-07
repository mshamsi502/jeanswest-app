// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/constants/test_data/user_tickets.dart';
import 'package:jeanswest/src/models/profile/message/user_ticket/ticket_message.dart';
import 'package:jeanswest/src/models/profile/message/user_ticket/user_ticket.dart';

void addTicketToUserTicket(String title, String text) {
  userTickets.add(UserTicket(
      title: title,
      message: [
        TicketMessage(
          title: user.firstName,
          text: text,
          yearOfSend: DateTime.now().year.toString(),
          monthOfSend: DateTime.now().month.toString(),
          dayOfSend: DateTime.now().day.toString(),
          hourOfSend: DateTime.now().hour.toString(),
          minOfSend: DateTime.now().minute.toString(),
          isUser: true,
        ),
      ],
      isClosed: false));
  print('******* message sended !');
  print('title : $title');
  print('text : $text');
  print('old userTickets length: ${userTickets.length}');
}

void addNewMessageInTicket(int numberOfTicket, String text) {
  TicketMessage newMessage = new TicketMessage(
    title: user.firstName,
    text: text,
    yearOfSend: DateTime.now().year.toString(),
    monthOfSend: DateTime.now().month.toString(),
    dayOfSend: DateTime.now().day.toString(),
    hourOfSend: DateTime.now().hour.toString(),
    minOfSend: DateTime.now().minute.toString(),
    isUser: true,
  );

  userTickets[numberOfTicket].message.add(newMessage);
  // print(
  //     'send message at ${DateTime.now().year}.${DateTime.now().month}.${DateTime.now().day} - ${DateTime.now().hour}:${DateTime.now().minute} :   $text');
  //
  // print(
  //     'messages length : ${userTickets[widget.numberOfTicket].message.length}');
}

// List<DropdownMenuItem<String>> buildDropdownMenuItems(
//     List<String> options, double myWidth, Size _screenSize) {
//   // ignore: deprecated_member_use
//   List<DropdownMenuItem<String>> items = new List<DropdownMenuItem<String>>();
//   for (String string in options) {
//     items.add(DropdownMenuItem(
//       value: string,
//       child: Container(
//         width: myWidth - (0.36 * _screenSize.width), //130,
//         height: 0.054 * _screenSize.height, // 30,
//         // color: Colors.red,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                     child: Text(
//                   string,
//                   style: TextStyle(
//                     fontFamily: 'IRANSans',
//                     fontSize: 0.033 * _screenSize.width, // 12,
//                   ),
//                 )),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ));
//   }

//   return items;
// }

List<Map<String, dynamic>> checkTicketIsValid({String title, String text}) {
  int titleLimit = 15;
  int textLimit = 128;
  Map<String, dynamic> resTitle = new Map<String, dynamic>();
  Map<String, dynamic> resText = new Map<String, dynamic>();
  if (title.length > 0 && title.length <= titleLimit) {
    resTitle = {
      'isValid': true,
      'errorMessage': '',
    };
  } else {
    if (title.length <= 0) {
      resTitle = {
        'isValid': false,
        'errorMessage': 'عنوان پیام نباید خالی باشد',
      };
    }
    if (title.length > titleLimit) {
      resTitle = {
        'isValid': false,
        'errorMessage': 'عنوان پیام نباید بیشتر $titleLimit رقم باشد',
      };
    }
  }
  if (text.length > 0 && text.length <= textLimit) {
    resText = {
      'isValid': true,
      'errorMessage': '',
    };
  } else {
    if (text.length <= 0) {
      resText = {
        'isValid': false,
        'errorMessage': 'متن پیام نباید خالی باشد',
      };
    }
    if (text.length > textLimit) {
      resText = {
        'isValid': false,
        'errorMessage': 'متن پیام نباید بیشتر $titleLimit رقم باشد',
      };
    }
  }

  return [resTitle, resText];
}
