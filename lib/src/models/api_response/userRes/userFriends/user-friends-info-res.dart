// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userMainInfo/user-main-info-res.dart';

part 'user-friends-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserFriendsInfoRes extends Equatable {
  @JsonKey(name: 'statusCode')
  int statusCode;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  List<UserMainInfoRes> data;

  UserFriendsInfoRes({
    this.statusCode,
    this.message,
    this.data,
  });

  factory UserFriendsInfoRes.fromJson(Map<String, dynamic> json) =>
      _$UserFriendsInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$UserFriendsInfoResToJson(this);

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
