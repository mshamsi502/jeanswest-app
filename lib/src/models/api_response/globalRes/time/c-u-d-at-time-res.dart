// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'c-u-d-at-time-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class CUDAtTimeRes extends Equatable {
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'deleted_at')
  String deletedAt;

  CUDAtTimeRes({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory CUDAtTimeRes.fromJson(Map<String, dynamic> json) =>
      _$CUDAtTimeResFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$CUDAtTimeResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }

  @override
  List<Object> get props => [
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
