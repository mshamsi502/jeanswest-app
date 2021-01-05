// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_profile
// *   Created Date & Time :  2020-11-25  ,  02:36 PM
// ****************************************************************************

// ignore: must_be_immutable

class TicketMessage {
  final String title;
  final String text;
  final String dayOfSend;
  final String monthOfSend;
  final String yearOfSend;
  final String hourOfSend;
  final String minOfSend;
  final bool isUser;

  TicketMessage({
    this.title,
    this.text,
    this.dayOfSend,
    this.monthOfSend,
    this.yearOfSend,
    this.hourOfSend,
    this.minOfSend,
    this.isUser,
  });
}
