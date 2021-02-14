// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'success_response.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class SuccessRespons extends Equatable {
  @JsonKey(name: 'success')
  bool success;

  SuccessRespons({
    this.success,
  });

  factory SuccessRespons.fromJson(Map<String, dynamic> json) =>
      _$SuccessResponsFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
    };
  }

  @override
  List<Object> get props => [
        success,
      ];
}
