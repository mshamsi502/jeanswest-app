// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMessages/dataFavorite/message-data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user-messages-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserMessagesInfoRes extends Equatable {
  @JsonKey(name: 'statusCode')
  int statusCode;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  List<MessageData> data;

  UserMessagesInfoRes({
    this.statusCode,
    this.message,
    this.data,
  });

  factory UserMessagesInfoRes.fromJson(Map<String, dynamic> json) =>
      _$UserMessagesInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$UserMessagesInfoResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
      'addresses': data,
    };
  }

  @override
  List<Object> get props => [
        statusCode,
        message,
        data,
      ];
}
