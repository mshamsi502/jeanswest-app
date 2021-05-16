// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'province.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class Province extends Equatable {
  @JsonKey(name: 'id_state')
  int idState;
  @JsonKey(name: 'name')
  String name;

  Province({
    this.name,
    this.idState,
  });

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_state': idState,
      'name': name,
    };
  }

  @override
  List<Object> get props => [
        idState,
        name,
      ];
}
