// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/address-info-res.dart';

part 'user-addresses-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserAddressesInfoRes extends Equatable {
  @JsonKey(name: 'addresses')
  List<AddressInfoRes> addresses;

  UserAddressesInfoRes({
    this.addresses,
  });

  factory UserAddressesInfoRes.fromJson(Map<String, dynamic> json) =>
      _$UserAddressesInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressesInfoResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'addresses': addresses,
    };
  }

  @override
  List<Object> get props => [
        addresses,
      ];
}
