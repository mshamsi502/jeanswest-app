// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/loginRes/jeanswestRes/get-token-res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth-req-response.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class AuthReqRespons extends Equatable {
  @JsonKey(name: 'statusCode')
  int statusCode;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  GetTokenRes data;

  AuthReqRespons({
    this.statusCode,
    this.message,
    this.data,
  });

  factory AuthReqRespons.fromJson(Map<String, dynamic> json) =>
      _$AuthReqResponsFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$AuthReqResponsToJson(this);

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
