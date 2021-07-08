// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branch-for-product.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class BranchForProduct extends Equatable {
  @JsonKey(name: 'Kbarcode')
  String kBarcode;

  @JsonKey(name: 'DepartmentInfo_ID')
  String departmentInfoID;

  @JsonKey(name: 'DepName')
  String depName;

  @JsonKey(name: 'LocationPoint')
  String locationPoint;

  @JsonKey(name: 'DepTel')
  String depTel;

  @JsonKey(name: 'DepAddress')
  String depAddress;

  @JsonKey(name: 'StockStatus')
  String stockStatus;

  @JsonKey(name: 'lat')
  String lat;

  @JsonKey(name: 'long')
  String lng;

  @JsonKey(defaultValue: 'همه روزه از 10 تا 22', name: 'WorkTime')
  String workTime;

  BranchForProduct({
    this.kBarcode,
    this.departmentInfoID,
    this.depName,
    this.locationPoint,
    this.depTel,
    this.depAddress,
    this.stockStatus,
    this.lat,
    this.lng,
    this.workTime,
  });

  factory BranchForProduct.fromJson(Map<String, dynamic> json) =>
      _$BranchForProductFromJson(json);

  Map<String, dynamic> toJson() => _$BranchForProductToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Kbarcode': kBarcode,
      'DepartmentInfo_ID': departmentInfoID,
      'DepName': depName,
      'LocationPoint': locationPoint,
      'DepTel': depTel,
      'DepAddress': depAddress,
      'StockStatus': stockStatus,
      'lat': lat,
      'lng': lng,
      'workTime': workTime,
    };
  }

  @override
  List<Object> get props => [
        kBarcode,
        departmentInfoID,
        depName,
        locationPoint,
        depTel,
        depAddress,
        stockStatus,
        lat,
        lng,
        workTime,
      ];
}
