// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-online-order-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOnlineOrderRes _$UserOnlineOrderResFromJson(Map<String, dynamic> json) {
  return UserOnlineOrderRes(
    code: json['code'] as String,
    receiverName: json['receiverName'] as String,
    phoneNumber: json['phoneNumber'] as String,
    products: (json['products'] as List)
        ?.map((e) => e == null
            ? null
            : ProductOrderRes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    countProducts:
        (json['countProducts'] as List)?.map((e) => e as int)?.toList(),
    confirmDate: json['confirmDate'] == null
        ? null
        : ExactTimeRes.fromJson(json['confirmDate'] as Map<String, dynamic>),
    recieveDate: json['recieveDate'] == null
        ? null
        : PeriodTimeRes.fromJson(json['recieveDate'] as Map<String, dynamic>),
    paymentDate: json['paymentDate'] == null
        ? null
        : ExactTimeRes.fromJson(json['paymentDate'] as Map<String, dynamic>),
    address: json['address'] == null
        ? null
        : AddressInfoRes.fromJson(json['address'] as Map<String, dynamic>),
    statusShopping: json['statusShopping'] as String,
    statusStepReturn: json['statusStepReturn'] as String,
    trackingCode: json['trackingCode'] as String,
    paymentPlan: json['paymentPlan'] as String,
    isPaid: json['isPaid'] as bool,
    paymentTrackingCode: json['paymentTrackingCode'] as String,
    sendMethod: json['sendMethod'] as String,
    sendPrice: json['sendPrice'] as String,
  );
}

Map<String, dynamic> _$UserOnlineOrderResToJson(UserOnlineOrderRes instance) =>
    <String, dynamic>{
      'code': instance.code,
      'receiverName': instance.receiverName,
      'phoneNumber': instance.phoneNumber,
      'products': instance.products,
      'countProducts': instance.countProducts,
      'confirmDate': instance.confirmDate,
      'recieveDate': instance.recieveDate,
      'paymentDate': instance.paymentDate,
      'address': instance.address,
      'statusShopping': instance.statusShopping,
      'statusStepReturn': instance.statusStepReturn,
      'trackingCode': instance.trackingCode,
      'paymentPlan': instance.paymentPlan,
      'isPaid': instance.isPaid,
      'paymentTrackingCode': instance.paymentTrackingCode,
      'sendMethod': instance.sendMethod,
      'sendPrice': instance.sendPrice,
    };
