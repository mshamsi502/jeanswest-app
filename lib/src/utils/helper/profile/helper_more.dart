// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

// import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-tickets-info.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/dataTickets/single-ticket/single-ticket.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/dataTickets/data-ticket.dart';

void addTicketToUserTicket(String title, String text) {
  userTickets.add(
    DataTicket(
      title: title,
      context: [
        SingleTicket(
          text: text,
          owner: 'customer',
          createdAt: DateTime.now().toString(),
        ),
      ],
      status: 1,
    ),
  );
  print('******* message sended !');
  print('title : $title');
  print('text : $text');
  print('old userTickets length: ${userTickets.length}');
}

void addNewMessageInTicket(int numberOfTicket, String text) {
  SingleTicket newMessage = new SingleTicket(
    text: text,
    owner: 'customer',
    createdAt: DateTime.now().toString(),
  );

  userTickets[numberOfTicket].context.add(newMessage);
  // print(
  //     'send message at ${DateTime.now().year}.${DateTime.now().month}.${DateTime.now().day} - ${DateTime.now().hour}:${DateTime.now().minute} :   $text');
  //
  // print(
  //     'messages length : ${userTickets[widget.numberOfTicket].message.length}');
}

// List<DropdownMenuItem<String>> buildDropdownMenuItems(
//     {List<String> options, double myWidth, Size screenSize}) {
//   // ignore: deprecated_member_use
//   List<DropdownMenuItem<String>> items = new List<DropdownMenuItem<String>>();
//   for (String string in options) {
//     items.add(DropdownMenuItem(
//       value: string,
//       child: Container(
//         width: myWidth - (0.36 * screenSize.width), //130,
//         height: 0.054 * screenSize.height, // 30,
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
//                     fontSize: 0.033 * screenSize.width, // 12,
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
