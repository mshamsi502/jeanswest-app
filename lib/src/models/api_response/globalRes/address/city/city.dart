// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class City extends Equatable {
  @JsonKey(name: 'id_city')
  int idCity;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'has_district')
  int hasDistrict;
  @JsonKey(name: 'get_location')
  int getLocation;
  @JsonKey(name: 'default_location')
  String defaultLocation;

  City({
    this.idCity,
    this.name,
    this.hasDistrict,
    this.getLocation,
    this.defaultLocation,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_city': idCity,
      'name': name,
      'has_district': hasDistrict,
      'get_location': getLocation,
      'default_location': defaultLocation,
    };
  }

  @override
  List<Object> get props => [
        idCity,
        name,
        hasDistrict,
        getLocation,
        defaultLocation,
      ];
}
