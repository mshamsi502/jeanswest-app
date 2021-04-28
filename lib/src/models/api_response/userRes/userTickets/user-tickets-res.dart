// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/dataTickets/data-ticket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user-tickets-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserTicketsRes extends Equatable {
  @JsonKey(name: 'statusCode')
  int statusCode;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  List<DataTicket> data;

  UserTicketsRes({
    this.statusCode,
    this.message,
    this.data,
  });

  factory UserTicketsRes.fromJson(Map<String, dynamic> json) =>
      _$UserTicketsResFromJson(json);

  Map<String, dynamic> toJson() => _$UserTicketsResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }

  @override
  List<Object> get props => [
        statusCode,
        message,
        data,
      ];
}
