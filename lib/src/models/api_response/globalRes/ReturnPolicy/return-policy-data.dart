// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jeanswest/src/models/api_response/globalRes/ReturnPolicy/return-policy-description.dart';

part 'return-policy-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class ReturnPolicyData extends Equatable {
  @JsonKey(name: 'condition')
  String condition;
  @JsonKey(name: 'description')
  ReturnPolicyDescription description;

  ReturnPolicyData({
    this.condition,
    this.description,
  });

  factory ReturnPolicyData.fromJson(Map<String, dynamic> json) =>
      _$ReturnPolicyDataFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$ReturnPolicyDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'condition': condition,
      'description': description,
    };
  }

  @override
  List<Object> get props => [
        condition,
        description,
      ];
}
