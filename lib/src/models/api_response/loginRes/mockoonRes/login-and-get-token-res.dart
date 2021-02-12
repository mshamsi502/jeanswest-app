// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login-and-get-token-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class LoginAndGetTokenRes extends Equatable {
  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'token')
  String token;

  LoginAndGetTokenRes({
    this.success,
    this.token,
  });

  factory LoginAndGetTokenRes.fromJson(Map<String, dynamic> json) =>
      _$LoginAndGetTokenResFromJson(json);

  Map<String, dynamic> toJson() => _$LoginAndGetTokenResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'token': token,
    };
  }

  @override
  List<Object> get props => [
        success,
        token,
      ];
}
