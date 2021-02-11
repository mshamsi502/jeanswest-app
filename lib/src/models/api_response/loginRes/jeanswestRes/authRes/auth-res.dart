// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class AuthRes extends Equatable {
  @JsonKey(name: 'token')
  String token;

  AuthRes({
    this.token,
  });

  factory AuthRes.fromJson(Map<String, dynamic> json) =>
      _$AuthResFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  @override
  List<Object> get props => [
        token,
      ];
}
