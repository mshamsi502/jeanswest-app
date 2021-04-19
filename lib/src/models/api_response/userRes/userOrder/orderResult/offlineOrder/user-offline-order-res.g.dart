// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-offline-order-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOfflineOrderRes _$UserOfflineOrderResFromJson(Map<String, dynamic> json) {
  return UserOfflineOrderRes(
    code: json['code'] as String,
    receiverName: json['receiverName'] as String,
    products: (json['products'] as List)
        ?.map((e) => e == null
            ? null
            : ProductOrderRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    countProducts:
        (json['countProducts'] as List)?.map((e) => e as int)?.toList(),
    returnedProduct:
        (json['returnedProduct'] as List)?.map((e) => e as bool)?.toList(),
    longBranchName: json['longBranchName'] as String,
    shortBranchName: json['shortBranchName'] as String,
    shoppingDate: json['shoppingDate'] == null
        ? null
        : ExactTimeRes.fromJson(json['shoppingDate'] as Map<String, dynamic>),
    paymentDate: json['paymentDate'] == null
        ? null
        : ExactTimeRes.fromJson(json['paymentDate'] as Map<String, dynamic>),
    paymentPlan:
        (json['paymentPlan'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UserOfflineOrderResToJson(
        UserOfflineOrderRes instance) =>
    <String, dynamic>{
      'code': instance.code,
      'receiverName': instance.receiverName,
      'products': instance.products,
      'countProducts': instance.countProducts,
      'returnedProduct': instance.returnedProduct,
      'longBranchName': instance.longBranchName,
      'shortBranchName': instance.shortBranchName,
      'shoppingDate': instance.shoppingDate,
      'paymentDate': instance.paymentDate,
      'paymentPlan': instance.paymentPlan,
    };
