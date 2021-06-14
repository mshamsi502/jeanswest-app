// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user-invite-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserInviteInfoRes extends Equatable {
  @JsonKey(name: 'receivedGift')
  int receivedGift;
  @JsonKey(name: 'someOfInvited')
  int someOfInvited;
  @JsonKey(name: 'someOfInstallFromInvited')
  int someOfInstallFromInvited;
  @JsonKey(name: 'someOfShoppingFromInvited')
  int someOfShoppingFromInvited;

  UserInviteInfoRes({
    this.receivedGift,
    this.someOfInvited,
    this.someOfInstallFromInvited,
    this.someOfShoppingFromInvited,
  });

  factory UserInviteInfoRes.fromJson(Map<String, dynamic> json) =>
      _$UserInviteInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$UserInviteInfoResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'receivedGift': receivedGift,
      'someOfInvited': someOfInvited,
      'someOfInstallFromInvited': someOfInstallFromInvited,
      'phoneNumber': someOfShoppingFromInvited,
    };
  }

  @override
  List<Object> get props => [
        receivedGift,
        someOfInvited,
        someOfInstallFromInvited,
        someOfShoppingFromInvited,
      ];
}
