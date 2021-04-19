// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/data-order-result-res.dart';

part 'user-order-data-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserOrderDataRes extends Equatable {
  @JsonKey(name: 'data')
  UserOrderResultRes data;

  UserOrderDataRes({
    this.data,
  });

  factory UserOrderDataRes.fromJson(Map<String, dynamic> json) =>
      _$UserOrderDataResFromJson(json);

  Map<String, dynamic> toJson() => _$UserOrderDataResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  @override
  List<Object> get props => [
        data,
      ];
}
