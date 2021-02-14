// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/user-main-info-res.dart';

part 'user-friends-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserFriendsInfoRes extends Equatable {
  @JsonKey(name: 'friends')
  List<UserMainInfoRes> friends;

  UserFriendsInfoRes({
    this.friends,
  });

  factory UserFriendsInfoRes.fromJson(Map<String, dynamic> json) =>
      _$UserFriendsInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$UserFriendsInfoResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'friends': friends,
    };
  }

  @override
  List<Object> get props => [
        friends,
      ];
}
