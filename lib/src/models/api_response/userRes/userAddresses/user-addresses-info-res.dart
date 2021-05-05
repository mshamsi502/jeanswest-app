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
  @JsonKey(name: 'statusCode')
  int statusCode;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  List<AddressInfoRes> data;

  UserAddressesInfoRes({
    this.statusCode,
    this.message,
    this.data,
  });

  factory UserAddressesInfoRes.fromJson(Map<String, dynamic> json) =>
      _$UserAddressesInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressesInfoResToJson(this);

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
