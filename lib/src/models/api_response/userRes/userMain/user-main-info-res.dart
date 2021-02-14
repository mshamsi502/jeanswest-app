// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user-main-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserMainInfoRes extends Equatable {
  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'lastName')
  String lastName;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'phoneNumber')
  String phoneNumber;
  @JsonKey(name: 'gender')
  String gender;
  @JsonKey(name: 'birthDate')
  String birthDate;

  UserMainInfoRes({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.birthDate,
  });

  factory UserMainInfoRes.fromJson(Map<String, dynamic> json) =>
      _$UserMainInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$UserMainInfoResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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
        firstName,
        lastName,
        email,
        phoneNumber,
        gender,
        birthDate,
      ];
}
