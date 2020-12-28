// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_profile
// *   Created Date & Time :  2020-11-25  ,  02:36 PM
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
