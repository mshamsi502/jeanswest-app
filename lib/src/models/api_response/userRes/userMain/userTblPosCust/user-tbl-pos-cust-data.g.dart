// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-tbl-pos-cust-data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTblPosCustData _$UserTblPosCustDataFromJson(Map<String, dynamic> json) {
  return UserTblPosCustData(
    tblPosCustomersID: json['tblPosCustomers_ID'] as String,
    pay: json['Pay'] as String,
    cTypeName: json['CTypeName'] as String,
    priceLevel: json['PriceLevel'] as String,
    priceLevelTo: json['PriceLevelTo'] as String,
  );
}

Map<String, dynamic> _$UserTblPosCustDataToJson(UserTblPosCustData instance) =>
    <String, dynamic>{
      'tblPosCustomers_ID': instance.tblPosCustomersID,
      'Pay': instance.pay,
      'CTypeName': instance.cTypeName,
      'PriceLevel': instance.priceLevel,
      'PriceLevelTo': instance.priceLevelTo,
    };
