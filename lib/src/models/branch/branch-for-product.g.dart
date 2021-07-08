// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch-for-product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchForProduct _$BranchForProductFromJson(Map<String, dynamic> json) {
  return BranchForProduct(
    kBarcode: json['Kbarcode'] as String,
    departmentInfoID: json['DepartmentInfo_ID'] as String,
    depName: json['DepName'] as String,
    locationPoint: json['LocationPoint'] as String,
    depTel: json['DepTel'] as String,
    depAddress: json['DepAddress'] as String,
    stockStatus: json['StockStatus'] as String,
    lat: json['lat'] as String,
    lng: json['long'] as String,
  );
}

Map<String, dynamic> _$BranchForProductToJson(BranchForProduct instance) =>
    <String, dynamic>{
      'Kbarcode': instance.kBarcode,
      'DepartmentInfo_ID': instance.departmentInfoID,
      'DepName': instance.depName,
      'LocationPoint': instance.locationPoint,
      'DepTel': instance.depTel,
      'DepAddress': instance.depAddress,
      'StockStatus': instance.stockStatus,
      'lat': instance.lat,
      'long': instance.lng,
    };
