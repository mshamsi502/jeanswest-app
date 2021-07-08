// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/branch/branch-for-product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exist-in-branches-list-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class ExistInBranchesListRes extends Equatable {
  @JsonKey(name: 'statusCode')
  int statusCode;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  List<BranchForProduct> data;
  
  ExistInBranchesListRes({
    this.statusCode,
    this.message,
    this.data,
  });

  factory ExistInBranchesListRes.fromJson(Map<String, dynamic> json) =>
      _$ExistInBranchesListResFromJson(json);

  Map<String, dynamic> toJson() => _$ExistInBranchesListResToJson(this);

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
