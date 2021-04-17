// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/onlineOrder/user-online-order-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/offlineOrder/user-offline-order-res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data-order-result-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class UserOrderResultRes extends Equatable {
  @JsonKey(name: 'inProgressOrders')
  List<UserOnlineOrderRes> inProgressOrders;
  @JsonKey(name: 'compeletedOrders')
  List<UserOnlineOrderRes> compeletedOrders;
  @JsonKey(name: 'returnedOrders')
  List<UserOnlineOrderRes> returnedOrders;
  @JsonKey(name: 'offlineOrders')
  List<UserOfflineOrderRes> offlineOrders;

  UserOrderResultRes({
    this.inProgressOrders,
    this.compeletedOrders,
    this.returnedOrders,
    this.offlineOrders,
  });

  factory UserOrderResultRes.fromJson(Map<String, dynamic> json) =>
      _$UserOrderResultResFromJson(json);

  Map<String, dynamic> toJson() => _$UserOrderResultResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'inProgressOrders': inProgressOrders,
      'compeletedOrders': compeletedOrders,
      'returnedOrders': returnedOrders,
      'offlineOrders': offlineOrders,
    };
  }

  @override
  List<Object> get props => [
        inProgressOrders,
        compeletedOrders,
        returnedOrders,
        offlineOrders,
      ];
}
