// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get-token-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class GetTokenRes extends Equatable {
  @JsonKey(name: 'accessToken')
  String accessToken;

  GetTokenRes({
    this.accessToken,
  });

  factory GetTokenRes.fromJson(Map<String, dynamic> json) =>
      _$GetTokenResFromJson(json);

  Map<String, dynamic> toJson() => _$GetTokenResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
    };
  }

  @override
  List<Object> get props => [
        accessToken,
      ];
}
