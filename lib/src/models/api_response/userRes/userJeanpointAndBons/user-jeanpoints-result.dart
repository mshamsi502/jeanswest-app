// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user-jeanpoints-result.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserJeanpointsResult extends Equatable {
  @JsonKey(name: 'code')
  int code;
  @JsonKey(name: 'engName')
  String engName;
  @JsonKey(name: 'perName')
  String perName;
  @JsonKey(name: 'description')
  List<String> description;
  @JsonKey(name: 'price')
  int price;
  @JsonKey(name: 'minShopping')
  int minShopping;
  @JsonKey(name: 'startDate')
  String startDate;
  @JsonKey(name: 'endDate')
  String endDate;

  UserJeanpointsResult({
    this.code,
    this.engName,
    this.perName,
    this.description,
    this.price,
    this.minShopping,
    this.startDate,
    this.endDate,
  });

  factory UserJeanpointsResult.fromJson(Map<String, dynamic> json) =>
      _$UserJeanpointsResultFromJson(json);

  Map<String, dynamic> toJson() => _$UserJeanpointsResultToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'engName': engName,
      'perName': perName,
      'description': description,
      'price': price,
      'minShopping': minShopping,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  @override
  List<Object> get props => [
        code,
        engName,
        perName,
        description,
        price,
        minShopping,
        startDate,
        endDate,
      ];
}
