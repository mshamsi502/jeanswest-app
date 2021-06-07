import 'package:jeanswest/src/models/api_response/userRes/userTickets/dataTickets/data-ticket.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/dataTickets/single-ticket/single-ticket.dart';

List<DataTicket> userTickets = [
  DataTicket(
    ticketCode: '',
    title: '',
    context: [
      SingleTicket(
        owner: '',
        text: '',
        contextCode: "",
        createdAt: '',
      ),
    ],
  ),
];
