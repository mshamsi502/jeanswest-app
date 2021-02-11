// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'global-response.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class GlobalResponse extends Equatable {
  @JsonKey(name: 'code')
  int code;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  String data;

  GlobalResponse({
    this.code,
    this.message,
    this.data,
  });

  factory GlobalResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalResponseToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'data': data,
    };
  }

  @override
  List<Object> get props => [
        code,
        message,
        data,
      ];
}
