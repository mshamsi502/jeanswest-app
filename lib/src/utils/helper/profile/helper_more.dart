// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/userAllInfo.dart';
import 'package:jeanswest/src/constants/test_data/user_tickets.dart';
import 'package:jeanswest/src/models/message/user_ticket/ticket_message.dart';
import 'package:jeanswest/src/models/message/user_ticket/user_ticket.dart';

void addTicketToUserTicket(String department, String title, String text) {
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
  print('department : $department');
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

List<DropdownMenuItem<String>> buildDropdownMenuItems(
    List<String> options, double myWidth, Size _screenSize) {
  List<DropdownMenuItem<String>> items = new List<DropdownMenuItem<String>>();
  for (String string in options) {
    items.add(DropdownMenuItem(
      value: string,
      child: Container(
        width: myWidth - (0.36 * _screenSize.width), //130,
        height: 0.054 * _screenSize.height, // 30,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  string,
                  style: TextStyle(
                    fontFamily: 'IRANSans',
                    fontSize: 0.033 * _screenSize.width, // 12,
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    ));
  }
  return items;
}
