// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user-payment-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserPaymentInfoRes extends Equatable {
  @JsonKey(name: 'moneyBuying')
  int moneyBuying;

  UserPaymentInfoRes({
    this.moneyBuying,
  });

  factory UserPaymentInfoRes.fromJson(Map<String, dynamic> json) =>
      _$UserPaymentInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$UserPaymentInfoResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'moneyBuying': moneyBuying,
    };
  }

  @override
  List<Object> get props => [
        moneyBuying,
      ];
}
