// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/dataTickets/single-ticket/single-ticket.dart';

part 'data-ticket.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class DataTicket extends Equatable {
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'context')
  List<SingleTicket> context;
  @JsonKey(name: 'status')
  int status;

  DataTicket({
    this.code,
    this.title,
    this.context,
    this.status,
  });

  factory DataTicket.fromJson(Map<String, dynamic> json) =>
      _$DataTicketFromJson(json);

  Map<String, dynamic> toJson() => _$DataTicketToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'title': title,
      'context': context,
      'status': status,
    };
  }

  @override
  List<Object> get props => [
        code,
        title,
        context,
        status,
      ];
}
