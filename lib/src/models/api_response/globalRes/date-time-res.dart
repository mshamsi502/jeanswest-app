// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'date-time-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class DateTimeRes extends Equatable {
  @JsonKey(name: 'createdAt')
  String createdAt;
  @JsonKey(name: 'updatedAt')
  String updatedAt;
  @JsonKey(name: 'deletedAt')
  String deletedAt;

  DateTimeRes({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory DateTimeRes.fromJson(Map<String, dynamic> json) =>
      _$DateTimeResFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$DateTimeResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }

  @override
  List<Object> get props => [
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
