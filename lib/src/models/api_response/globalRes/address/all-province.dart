// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/province/province.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all-province.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class AllProvince extends Equatable {
  @JsonKey(name: 'statusCode')
  int statusCode;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  List<Province> data;

  AllProvince({
    this.statusCode,
    this.message,
    this.data,
  });

  factory AllProvince.fromJson(Map<String, dynamic> json) =>
      _$AllProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$AllProvinceToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }

  @override
  List<Object> get props => [
        statusCode,
        message,
        data,
      ];
}
