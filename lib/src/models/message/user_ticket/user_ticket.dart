// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/models/message/user_ticket/ticket_message.dart';

class UserTicket {
  final String title;
  final List<TicketMessage> message;
  final bool isClosed;

  UserTicket({
    this.title,
    this.message,
    this.isClosed,
  });
}
