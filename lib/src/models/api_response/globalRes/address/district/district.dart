// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class District extends Equatable {
  @JsonKey(name: 'id_district')
  int idDistrict;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'full_name')
  String fullName;
  @JsonKey(name: 'code')
  int code;
  @JsonKey(name: 'default_location')
  String defaultLocation;

  District({
    this.idDistrict,
    this.name,
    this.fullName,
    this.code,
    this.defaultLocation,
  });

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_district': idDistrict,
      'name': name,
      'full_name': fullName,
      'code': code,
      'default_location': defaultLocation,
    };
  }

  @override
  List<Object> get props => [
        idDistrict,
        name,
        fullName,
        code,
        defaultLocation,
      ];
}
