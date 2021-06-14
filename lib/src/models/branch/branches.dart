// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'branch.dart';

part 'branches.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class Branches extends Equatable {
  @JsonKey(name: 'branches')
  List<Branch> branches;

  Branches({
    this.branches,
  });

  factory Branches.fromJson(Map<String, dynamic> json) =>
      _$BranchesFromJson(json);

  Map<String, dynamic> toJson() => _$BranchesToJson(this);

  @override
  List<Object> get props => [
        branches,
      ];
}
