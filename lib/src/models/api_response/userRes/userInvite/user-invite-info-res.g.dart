// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-invite-info-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInviteInfoRes _$UserInviteInfoResFromJson(Map<String, dynamic> json) {
  return UserInviteInfoRes(
    receivedGift: json['receivedGift'] as int,
    someOfInvited: json['someOfInvited'] as int,
    someOfInstallFromInvited: json['someOfInstallFromInvited'] as int,
    someOfShoppingFromInvited: json['someOfShoppingFromInvited'] as int,
  );
}

Map<String, dynamic> _$UserInviteInfoResToJson(UserInviteInfoRes instance) =>
    <String, dynamic>{
      'receivedGift': instance.receivedGift,
      'someOfInvited': instance.someOfInvited,
      'someOfInstallFromInvited': instance.someOfInstallFromInvited,
      'someOfShoppingFromInvited': instance.someOfShoppingFromInvited,
    };
