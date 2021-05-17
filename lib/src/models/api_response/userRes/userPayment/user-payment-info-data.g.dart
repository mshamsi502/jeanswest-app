// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-payment-info-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPaymentInfoData _$UserPaymentInfoDataFromJson(Map<String, dynamic> json) {
  return UserPaymentInfoData(
    tblPosCustomersID: json['tblPosCustomers_ID'] as String,
    moneyBuying: json['Pay'] as int,
    cusType: json['CusType'] as String,
    cTypeName: json['CTypeName'] as String,
    priceLevel: json['PriceLevel'] as int,
    priceLevelTo: json['PriceLevelTo'] as int,
  );
}

Map<String, dynamic> _$UserPaymentInfoDataToJson(
        UserPaymentInfoData instance) =>
    <String, dynamic>{
      'tblPosCustomers_ID': instance.tblPosCustomersID,
      'Pay': instance.moneyBuying,
      'CusType': instance.cusType,
      'CTypeName': instance.cTypeName,
      'PriceLevel': instance.priceLevel,
      'PriceLevelTo': instance.priceLevelTo,
    };
