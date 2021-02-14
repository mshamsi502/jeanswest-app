// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
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
