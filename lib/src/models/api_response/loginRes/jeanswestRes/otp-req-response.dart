// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp-req-response.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class OTPReqResponse extends Equatable {
  @JsonKey(name: 'statusCode')
  int statusCode;
  @JsonKey(name: 'message')
  String message;

  OTPReqResponse({
    this.statusCode,
    this.message,
  });

  factory OTPReqResponse.fromJson(Map<String, dynamic> json) =>
      _$OTPReqResponseFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$OTPReqResponseToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
    };
  }

  @override
  List<Object> get props => [
        statusCode,
        message,
      ];
}
