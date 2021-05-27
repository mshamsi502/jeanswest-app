// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user-main-info-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserMainInfoData extends Equatable {
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'lastName')
  String lastName;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'phoneNumber')
  String phoneNumber;
  @JsonKey(name: 'gender')
  int gender;
  @JsonKey(name: 'birthDate')
  String birthDate;
  //
  // @JsonKey(name: 'id')
  // String id;
  // @JsonKey(name: 'active')
  // bool active;
  // @JsonKey(name: 'loggedInAt')
  // String loggedInAt;
  // @JsonKey(name: 'erpId')
  // String erpId;
  // @JsonKey(name: 'erpPartnerShipCode')
  // String erpPartnerShipCode;
  // @JsonKey(name: 'erpCustomerType')
  // String erpCustomerType;
  // @JsonKey(name: 'erpTsCodeId')
  // String erpTsCodeId;
  // @JsonKey(name: 'erpUpdatedAt')
  // String erpUpdatedAt;
  // @JsonKey(name: 'datetime')
  // CUDAtTimeRes datetime;
  //

  UserMainInfoData({
    this.code,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.birthDate,
  });

  factory UserMainInfoData.fromJson(Map<String, dynamic> json) =>
      _$UserMainInfoDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserMainInfoDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'birthDate': birthDate,
    };
  }

  @override
  List<Object> get props => [
        code,
        firstName,
        lastName,
        email,
        phoneNumber,
        gender,
        birthDate,
      ];
}
