// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/constants/test_data/texts.dart';
import 'package:jeanswest/src/models/message/user_ticket/ticket_message.dart';
import 'package:jeanswest/src/models/message/user_ticket/user_ticket.dart';

import 'user.dart';

//
TicketMessage firstUserMessageFirstTicket = new TicketMessage(
  title: user.perName,
  text: shortLoremIpsum1,
  yearOfSend: '99',
  monthOfSend: '01',
  dayOfSend: '25',
  hourOfSend: '12',
  minOfSend: '02',
  isUser: true,
);

TicketMessage firstSupportMessageFirstTicket = new TicketMessage(
  title: 'پشتیبانی',
  text: shortLoremIpsum2,
  yearOfSend: '99',
  monthOfSend: '01',
  dayOfSend: '25',
  hourOfSend: '12',
  minOfSend: '10',
  isUser: false,
);
TicketMessage secondUserMessageFirstTicket = new TicketMessage(
  title: user.perName,
  text: longLoremIpsum,
  yearOfSend: '99',
  monthOfSend: '01',
  dayOfSend: '26',
  hourOfSend: '08',
  minOfSend: '38',
  isUser: true,
);
TicketMessage thirdUserMessageFirstTicket = new TicketMessage(
  title: user.perName,
  text: veryShortLoremIpsum,
  yearOfSend: '99',
  monthOfSend: '01',
  dayOfSend: '26',
  hourOfSend: '16',
  minOfSend: '49',
  isUser: true,
);
TicketMessage secondSupportMessageFirstTicket = new TicketMessage(
  title: 'پشتیبانی',
  text: medLoremIpsum,
  yearOfSend: '99',
  monthOfSend: '01',
  dayOfSend: '26',
  hourOfSend: '17',
  minOfSend: '05',
  isUser: false,
);
UserTicket firstTicket = UserTicket(
    title: 'مشکل پرداخت',
    message: [
      firstUserMessageFirstTicket,
      firstSupportMessageFirstTicket,
      secondUserMessageFirstTicket,
      thirdUserMessageFirstTicket,
      secondSupportMessageFirstTicket,
    ],
    isClosed: true);
//

//
TicketMessage firstUserMessageSecondTicket = new TicketMessage(
  title: user.perName,
  text: medLoremIpsum,
  yearOfSend: '99',
  monthOfSend: '03',
  dayOfSend: '08',
  hourOfSend: '21',
  minOfSend: '15',
  isUser: true,
);
TicketMessage secondUserMessageSecondTicket = new TicketMessage(
  title: user.perName,
  text: veryShortLoremIpsum,
  yearOfSend: '99',
  monthOfSend: '03',
  dayOfSend: '08',
  hourOfSend: '21',
  minOfSend: '16',
  isUser: true,
);

TicketMessage firstSupportMessageSecondTicket = new TicketMessage(
  title: 'پشتیبانی',
  text: shortLoremIpsum2,
  yearOfSend: '99',
  monthOfSend: '03',
  dayOfSend: '08',
  hourOfSend: '21',
  minOfSend: '17',
  isUser: false,
);

TicketMessage thirdUserMessageSecondTicket = new TicketMessage(
  title: user.perName,
  text: shortLoremIpsum2,
  yearOfSend: '99',
  monthOfSend: '05',
  dayOfSend: '28',
  hourOfSend: '14',
  minOfSend: '03',
  isUser: true,
);
TicketMessage forthUserMessageSecondTicket = new TicketMessage(
  title: user.perName,
  text: shortLoremIpsum1,
  yearOfSend: '99',
  monthOfSend: '05',
  dayOfSend: '28',
  hourOfSend: '16',
  minOfSend: '23',
  isUser: true,
);
TicketMessage secondSupportMessageSecondTicket = new TicketMessage(
  title: 'پشتیبانی',
  text: longLoremIpsum,
  yearOfSend: '99',
  monthOfSend: '05',
  dayOfSend: '28',
  hourOfSend: '16',
  minOfSend: '23',
  isUser: false,
);
UserTicket secondTicket = UserTicket(
    title: 'وارد نشدن بن تخفیف',
    message: [
      firstUserMessageFirstTicket,
      secondUserMessageFirstTicket,
      firstSupportMessageFirstTicket,
      thirdUserMessageFirstTicket,
      forthUserMessageSecondTicket,
      secondSupportMessageFirstTicket,
    ],
    isClosed: true);
//

//
TicketMessage firstSupportMessageThirdTicket = new TicketMessage(
  title: 'پشتیبانی',
  text: medLoremIpsum,
  yearOfSend: '99',
  monthOfSend: '10',
  dayOfSend: '08',
  hourOfSend: '14',
  minOfSend: '37',
  isUser: false,
);
TicketMessage firstUserMessageThirdTicket = new TicketMessage(
  title: user.perName,
  text: longLoremIpsum,
  yearOfSend: '99',
  monthOfSend: '10',
  dayOfSend: '11',
  hourOfSend: '10',
  minOfSend: '36',
  isUser: true,
);
TicketMessage secondUserMessageThirdTicket = new TicketMessage(
  title: user.perName,
  text: shortLoremIpsum2,
  yearOfSend: '99',
  monthOfSend: '10',
  dayOfSend: '11',
  hourOfSend: '10',
  minOfSend: '36',
  isUser: true,
);

TicketMessage thirdUserMessageThirdTicket = new TicketMessage(
  title: user.perName,
  text: 'اوکی؟',
  yearOfSend: '99',
  monthOfSend: '10',
  dayOfSend: '11',
  hourOfSend: '10',
  minOfSend: '36',
  isUser: true,
);
TicketMessage secondSupportMessageThirdTicket = new TicketMessage(
  title: 'پشتیبانی',
  text: medLoremIpsum,
  yearOfSend: '99',
  monthOfSend: '10',
  dayOfSend: '11',
  hourOfSend: '10',
  minOfSend: '40',
  isUser: false,
);
UserTicket thirdTicket = UserTicket(
    title: 'گرفتن اطلاعات تکمیلی جهت معرفی برنده قرعه کشی بهمن 99',
    message: [
      firstSupportMessageFirstTicket,
      firstUserMessageFirstTicket,
      secondUserMessageFirstTicket,
      thirdUserMessageFirstTicket,
      secondSupportMessageFirstTicket,
    ],
    isClosed: false);
//

TicketMessage msg1 = new TicketMessage(
  title: 'پشتیبانی',
  text: 'اول',
  yearOfSend: '99',
  monthOfSend: '10',
  dayOfSend: '11',
  hourOfSend: '10',
  minOfSend: '40',
  isUser: false,
);
TicketMessage msg2 = new TicketMessage(
  title: user.perName,
  text: 'دوم',
  yearOfSend: '99',
  monthOfSend: '10',
  dayOfSend: '11',
  hourOfSend: '10',
  minOfSend: '40',
  isUser: true,
);
TicketMessage msg3 = new TicketMessage(
  title: 'پشتیبانی',
  text: 'سوم',
  yearOfSend: '99',
  monthOfSend: '10',
  dayOfSend: '11',
  hourOfSend: '10',
  minOfSend: '40',
  isUser: false,
);
UserTicket testTicket = UserTicket(
    title: 'تیکت تستی',
    message: [
      msg1,
      msg2,
      msg3,
    ],
    isClosed: false);
//

List<UserTicket> userTickets = [
  firstTicket,
  secondTicket,
  thirdTicket,
  firstTicket,
  secondTicket,
  firstTicket,
  secondTicket,
  firstTicket,
  thirdTicket,
  testTicket,
];
