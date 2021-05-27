// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single-ticket.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class SingleTicket extends Equatable {
  @JsonKey(name: 'owner')
  String owner;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'created_at')
  String createdAt;

  SingleTicket({
    this.owner,
    this.text,
    this.createdAt,
  });

  factory SingleTicket.fromJson(Map<String, dynamic> json) =>
      _$SingleTicketFromJson(json);

  Map<String, dynamic> toJson() => _$SingleTicketToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'owner': owner,
      'text': text,
      'created_at': createdAt,
    };
  }

  @override
  List<Object> get props => [
        owner,
        text,
        createdAt,
      ];
}
