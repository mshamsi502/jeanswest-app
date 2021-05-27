// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'country.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class Country extends Equatable {
  @JsonKey(name: 'name')
  String name;

  Country({
    this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  @override
  List<Object> get props => [
        name,
      ];
}
