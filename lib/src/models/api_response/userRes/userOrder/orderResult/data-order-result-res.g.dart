// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data-order-result-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOrderResultRes _$UserOrderResultResFromJson(Map<String, dynamic> json) {
  return UserOrderResultRes(
    inProgressOrders: (json['inProgressOrders'] as List)
        ?.map((e) => e == null
            ? null
            : UserOnlineOrderRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    compeletedOrders: (json['compeletedOrders'] as List)
        ?.map((e) => e == null
            ? null
            : UserOnlineOrderRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    returnedOrders: (json['returnedOrders'] as List)
        ?.map((e) => e == null
            ? null
            : UserOnlineOrderRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    offlineOrders: (json['offlineOrders'] as List)
        ?.map((e) => e == null
            ? null
            : UserOfflineOrderRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserOrderResultResToJson(UserOrderResultRes instance) =>
    <String, dynamic>{
      'inProgressOrders': instance.inProgressOrders,
      'compeletedOrders': instance.compeletedOrders,
      'returnedOrders': instance.returnedOrders,
      'offlineOrders': instance.offlineOrders,
    };
